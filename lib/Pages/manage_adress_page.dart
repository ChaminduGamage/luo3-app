import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/secondary_button.dart';
import 'package:luo3_app/theme/colors.dart';

class ManageAddressProfileTilePage extends StatefulWidget {
  const ManageAddressProfileTilePage({super.key});

  @override
  _ManageAddressProfileTilePageState createState() =>
      _ManageAddressProfileTilePageState();
}

class _ManageAddressProfileTilePageState
    extends State<ManageAddressProfileTilePage> {
  // Sample initial list of addresses
  List<Map<String, String>> addresses = [
    {
      'title': 'Home',
      'address': 'No. 123, Main Street,\nColombo 07, Sri Lanka'
    },
    {'title': 'Work', 'address': 'Lot 45, Office Avenue,\nMalabe, Sri Lanka'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
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
                  const SizedBox(width: 60),
                  Text(
                    'Manage Address',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Luo3Colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Address List
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: addresses.map((address) {
                    return Column(
                      children: [
                        _buildAddressTile(
                          title: address['title']!,
                          address: address['address']!,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),

            // Add New Address Button
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Add New Address",
                onPressed: () async {
                  final result =
                      await Navigator.pushNamed(context, '/add-address');
                  if (result != null) {
                    setState(() {
                      addresses.add(result as Map<String, String>);
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressTile({required String title, required String address}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on, color: Luo3Colors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Luo3Colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Luo3Colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Luo3Colors.textSecondary),
        ],
      ),
    );
  }
}
