import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/pages/renter/profile/bookmark_rentals_page.dart';
import 'package:luo3_app/pages/renter/profile/emergency_contact.dart';
import 'package:luo3_app/pages/renter/profile/manage_adress_page.dart';
import 'package:luo3_app/pages/renter/profile/notification_page.dart';
import 'package:luo3_app/pages/renter/profile/payment_method_page.dart';
import 'package:luo3_app/pages/renter/profile/your_profile.dart';
import 'package:luo3_app/services/auth_services.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverProfilePage extends StatefulWidget {
  final AuthServices _auth = AuthServices();
  DriverProfilePage({super.key});

  @override
  State<DriverProfilePage> createState() => _DriverProfilePageState();
}

class _DriverProfilePageState extends State<DriverProfilePage> {
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
                                context, '/vehicle-driver-home');
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
                    _profileTile(Icons.person_outline, 'Your Profile', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const YourProfilePage()),
                      );
                    }),

                    _profileTile(
                      Icons.notifications_outlined,
                      'Notification',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationProfileTilePage()),
                        );
                      },
                    ),
                    _profileTile(
                      Icons.credit_card_outlined,
                      'Payment Method',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentMethodProfilePage()),
                        );
                      },
                    ),
                    _profileTile(
                      Icons.bookmark_outline,
                      'Bookmark Rentals',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BookmarkRentalsPage()),
                        );
                      },
                    ),
                    _profileTile(Icons.settings_outlined, 'Settings'),
                    _profileTile(
                      Icons.phone_in_talk_outlined,
                      'Emergency Contact',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EmergencyContactPage()),
                        );
                      },
                    ),
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

                            // set is authenticated shared preferences as false
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('isAuthenticated', false);
                          } catch (e) {
                            print("Error during logout: $e");
                          }
                        },
                        child: Text(
                          "Logout Your Account",
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

  Widget _profileTile(IconData icon, String label, [VoidCallback? onTap]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
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

class _auth {}
