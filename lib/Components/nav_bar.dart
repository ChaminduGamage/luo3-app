import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/pages/chat_page.dart';
import 'package:luo3_app/pages/find_page.dart';
import 'package:luo3_app/pages/home_page.dart';
import 'package:luo3_app/pages/profile_page.dart';
import 'package:luo3_app/pages/rentals_page.dart';
import 'package:luo3_app/theme/colors.dart';

class Luo3NavBar extends StatefulWidget {
  const Luo3NavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Luo3NavBarState createState() => _Luo3NavBarState();
}

class _Luo3NavBarState extends State<Luo3NavBar> {
  int _currentIndex = 0;
  final Color primaryColor = Luo3Colors.primary;

  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.directions_car, // Assuming this for Rentals
    Icons.chat_bubble_outline,
    Icons.person,
  ];

  final List<Widget> _pages = const [
    HomePage(),
    FindPage(),
    RentalsPage(),
    ChatPage(),
    ProfilePage()
  ];

  final List<String> _labels = [
    'Home',
    'Search',
    'Rentals',
    'Chat',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: BottomAppBar(
            color: Luo3Colors.inputBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_icons.length, (index) {
                bool isSelected = index == _currentIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _icons[index],
                        color: isSelected ? primaryColor : Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _labels[index],
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: isSelected ? primaryColor : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
