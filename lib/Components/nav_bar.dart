import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/pages/renter/nav%20bar%20pages/chat_page.dart';
import 'package:luo3_app/pages/renter/nav%20bar%20pages/find_page.dart';
import 'package:luo3_app/pages/renter/nav%20bar%20pages/home_page.dart';
import 'package:luo3_app/pages/renter/nav%20bar%20pages/profile_page.dart';
import 'package:luo3_app/pages/renter/nav%20bar%20pages/rentals_page.dart';
import 'package:luo3_app/theme/colors.dart';

class Luo3NavBar extends StatefulWidget {
  final int? currentIndex;
  const Luo3NavBar({super.key, this.currentIndex = 0});

  @override
  State<Luo3NavBar> createState() => _Luo3NavBarState();
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

  final List<Widget> _pages = [
    const HomePage(),
    const FindPage(),
    const RentalsPage(),
    const ChatOpenPage(
      name: 'Default Name', // Replace with the appropriate value
      role: 'Default Role', // Replace with the appropriate value
    ),
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
  void initState() {
    _currentIndex = widget.currentIndex ?? 0;
    super.initState();
  }

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
