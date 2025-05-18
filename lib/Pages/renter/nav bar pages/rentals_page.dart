import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/active_renting_card.dart';
import 'package:luo3_app/components/booking_renting_card.dart';
import 'package:luo3_app/components/complete_renting_card.dart';
import 'package:luo3_app/theme/colors.dart';

class RentalsPage extends StatefulWidget {
  const RentalsPage({super.key});

  @override
  State<RentalsPage> createState() => _RentalsPageState();
}

class _RentalsPageState extends State<RentalsPage> {
  List<Map<String, dynamic>> _rentRequests = [];
  Future<List<Map<String, dynamic>>> fetchRentRequestsByCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception("No user is currently signed in.");
      }

      final snapshot = await FirebaseFirestore.instance
          .collection('rent_requests')
          .where('userId', isEqualTo: user.uid)
          .orderBy('requestedAt', descending: true) // Optional: sort by time
          .get();

      // Convert each document to a Map and include the document ID
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Include document ID if needed
        return data;
      }).toList();
    } catch (e) {
      print("Error fetching rent requests: $e");
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    _loadRentRequests();
  }

  void _loadRentRequests() async {
    final requests = await fetchRentRequestsByCurrentUser();
    setState(() {
      _rentRequests = requests;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                          child: const Icon(
                            Icons.arrow_back,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 100),
                      Text(
                        'Rentals',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            /// Tabs Section
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      unselectedLabelColor: Colors.grey,
                      labelColor: Luo3Colors.primary,

                      // KEEP your primary color underline
                      indicatorColor: Luo3Colors.primary,

                      // 👇 Add this to remove the gray border line
                      indicator: const UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 3.0, color: Luo3Colors.primary),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      // ignore: deprecated_member_use
                      overlayColor: MaterialStateProperty.all(Colors
                          .transparent), // optional: removes ripple effect background
                      dividerColor: Colors
                          .transparent, // 👈 this removes the gray divider under the tab bar

                      tabs: const [
                        Tab(text: 'Active'),
                        Tab(text: 'Completed'),
                        Tab(text: 'Booking'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: _rentRequests.map((request) {
                                return ActiveRentingCard(request: request);
                              }).toList(),
                            ),
                          ),
                          const Center(
                            child: CompleteRentignCard(),
                          ),
                          const Center(
                            child: BookingRentingCard(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
