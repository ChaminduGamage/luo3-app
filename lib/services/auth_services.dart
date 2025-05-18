import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:luo3_app/models/user_models.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _verificationId = '';

  UserModels? _userFromFirebaseUser(User? user) {
    return user != null ? UserModels(email: user.email!, password: '') : null;
  }

  Stream<UserModels?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Register user with role
  Future<User?> registerWithEmailAndPassword(
      String email, String password, String role) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      // Store user data including role
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'role': role,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String? getUid() {
    return _auth.currentUser?.uid;
  }

  // Get user role after login
  Future<String?> getUserRole() async {
    try {
      // Get current user
      User? user = _auth.currentUser;

      if (user != null) {
        // Get user document from Firestore
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        // Return the 'role' field if it exists
        if (userDoc.exists && userDoc.data() != null) {
          return userDoc.get('role') as String?;
        }
      }
      return null;
    } catch (e) {
      print('Error getting user role: $e');
      return null;
    }
  }

  // Set user profile
  Future<void> setProfile({
    required String fullName,
    required String phoneNumber,
    required int age,
  }) async {
    try {
      final String uid = _auth.currentUser!.uid;

      await _firestore.collection('users').doc(uid).set({
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'age': age,
      }, SetOptions(merge: true)); // merge: true keeps existing data

      print('User profile updated successfully.');
    } catch (e) {
      print('Error updating profile: ${e.toString()}');
    }
  }

  // Get user profile
  Future<String?> getPhoneNumber() async {
    try {
      final String uid = _auth.currentUser!.uid;
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc['phoneNumber'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching phone number: ${e.toString()}');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto verification
        await _auth.signInWithCredential(credential);
        print("Phone number automatically verified and user signed in");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId; // Save it for manual sign-in
        print("Code sent. Verification ID: $_verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId; // Save it even on timeout
        print("Auto retrieval timeout. Verification ID: $_verificationId");
      },
    );
  }

  Future<bool> signInWithSmsCode(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);
      print("User signed in with SMS code.");
      return true;
    } catch (e) {
      print("Error signing in with SMS code: $e");
      return false;
    }
  }

  // Check if user is logged in
  User? get currentUser => _auth.currentUser;

  Future<String?> getUserName() async {
    try {
      final String uid = _auth.currentUser!.uid;
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc['fullName'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching phone number: ${e.toString()}');
      return null;
    }
  }
}
