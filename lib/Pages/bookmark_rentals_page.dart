import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/theme/colors.dart';

class BookmarkRentalsPage extends StatefulWidget {
  const BookmarkRentalsPage({super.key});

  @override
  State<BookmarkRentalsPage> createState() => _BookmarkRentalsPageState();
}

class _BookmarkRentalsPageState extends State<BookmarkRentalsPage> {
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
                    'Bookmark Rentals',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Luo3Colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
