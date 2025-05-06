import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/services/auth_services.dart';
import 'package:luo3_app/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
  final AuthServices _auth = AuthServices();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/default-home');
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Luo3Colors.textPrimary,
                                width: 2,
                              ),
                            ),
                            child: const Icon(Icons.arrow_back,
                                color: Luo3Colors.textPrimary),
                          ),
                        ),
                        const SizedBox(width: 110),
                        Text(
                          'Profile',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Luo3Colors.scaffoldColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Luo3Colors.primary,
                              size: 40,
                            ),
                          ),
                          Positioned(
                            right: -5,
                            bottom: -5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Luo3Colors.primary,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Luo3Colors.inputBackground,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Luo3Colors.scaffoldColor,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Chamindu Gamage',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Profile Menu Items
                    _profileTile(Icons.person_outline, 'Your Profile'),
                    _profileTile(
                        Icons.location_on_outlined, 'Manage Your Address'),
                    _profileTile(Icons.notifications_none, 'Notification'),
                    _profileTile(Icons.payment, 'Payment Method'),
                    _profileTile(Icons.bookmark_outline, 'Bookmark Rentals'),
                    _profileTile(Icons.settings_outlined, 'Settings'),
                    _profileTile(
                        Icons.phone_in_talk_outlined, 'Emergency Contact'),
                    _profileTile(Icons.help_outline, 'Help Centre'),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Luo3Colors.primary, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () async {
                          try {
                            await widget._auth
                                .signOut(); // Ensure _auth is an instance of AuthServices
                            // Redirect to login or home screen after logout
                            Navigator.pushReplacementNamed(context, '/login');
                          } catch (e) {
                            print("Error during logout: $e");
                          }
                        },
                        child: Text(
                          "Logout Account",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Luo3Colors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Sticky Button at Bottom (still unused — you can implement if needed)
          ],
        ),
      ),
    );
  }

  Widget _profileTile(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          // Add navigation logic here if needed
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Luo3Colors.inputBackground,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Luo3Colors.primary),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Luo3Colors.textPrimary,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Luo3Colors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
