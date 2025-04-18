import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/pages/home_page.dart';
import 'package:luo3_app/theme/colors.dart';

class DrinkingModePage extends StatefulWidget {
  const DrinkingModePage({super.key});

  @override
  State<DrinkingModePage> createState() => _DrinkingModePageState();
}

class _DrinkingModePageState extends State<DrinkingModePage> {
  bool isDrinkingModeOn = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 210,
                decoration: const BoxDecoration(
                  color: Luo3Colors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Drinking Mode',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Luo3Colors.inputBackground,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDrinkingModeOn = !isDrinkingModeOn;
                              });
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                      milliseconds: 700), // Animation duration
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const HomePage(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 40, // Reverted to previous width
                              height: 20, // Reverted to previous height
                              decoration: BoxDecoration(
                                color: isDrinkingModeOn
                                    ? Luo3Colors.accent
                                    : Luo3Colors.textSecondary, // Track color
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Luo3Colors.inputBackground,
                                    width: 2), // Border color & width
                              ),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  AnimatedPositioned(
                                    duration: const Duration(milliseconds: 200),
                                    left: isDrinkingModeOn
                                        ? 21
                                        : 1, // Adjusted positioning slightly to avoid touching border
                                    child: Container(
                                      width: 14, // Reverted thumb size
                                      height: 14,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Luo3Colors
                                            .inputBackground, // Thumb color
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Location',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Luo3Colors.inputBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Luo3Colors.inputBackground,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Luo3Colors.primary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Your Location',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Luo3Colors.inputBackground,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Luo3Colors.inputBackground,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Luo3Colors.inputBackground,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.notification_important,
                              color: Luo3Colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print('Tapped');
                            },
                            child: Container(
                              width: 300,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Luo3Colors.inputBackground,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.search,
                                    color: Luo3Colors.textSecondary,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Search for a drink',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Luo3Colors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print('Tapped');
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Luo3Colors.accent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.filter_list,
                                color: Luo3Colors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Drivers List',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Luo3Colors.textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "See All",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Luo3Colors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Luo3Colors.inputBackground,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                        ),
                        child: Center(
                          // 👈 This vertically centers everything inside the container
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Optional, default is center
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                margin: const EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  color: Luo3Colors.textSecondary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      // ignore: deprecated_member_use
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // 👈 Vertically centers text
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Driver Name',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Luo3Colors.textPrimary,
                                      ),
                                    ),
                                    Text(
                                      'Driver Location',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Luo3Colors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                margin: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Luo3Colors.inputBackground,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  boxShadow: [
                                    BoxShadow(
                                      // ignore: deprecated_member_use
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.message),
                                  color: Luo3Colors.primary,
                                  onPressed: () {
                                    // Handle bookmark tap
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Luo3Colors.inputBackground,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  boxShadow: [
                                    BoxShadow(
                                      // ignore: deprecated_member_use
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.call),
                                  color: Luo3Colors.primary,
                                  onPressed: () {
                                    // Handle bookmark tap
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DottedBorder(
                      color: Luo3Colors.primary,
                      strokeWidth: 1.5,
                      dashPattern: const [6, 4],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(15),
                      child: InkWell(
                        onTap: () {
                          // Add your navigation or modal logic here
                          // ignore: avoid_print
                          print("Add new driver tapped");
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add,
                                color: Luo3Colors.primary,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Add New Driver',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Luo3Colors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'FAQs & Support',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Luo3Colors.inputBackground,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor:
                              Colors.transparent, // Removes default dividers
                        ),
                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide.none,
                          ),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide.none,
                          ),
                          title: Text(
                            'What is Drinking Mode?',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                          tilePadding: EdgeInsets.symmetric(horizontal: 16),
                          collapsedIconColor: Luo3Colors.primary,
                          iconColor: Luo3Colors.primary,
                          childrenPadding: EdgeInsets.only(bottom: 8),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Text(
                                'Drinking Mode is a feature that allows you to call a driver to drive you safely when you’re not in a condition to drive.',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Luo3Colors.textSecondary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Luo3Colors.inputBackground,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor:
                              Colors.transparent, // Removes default dividers
                        ),
                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide.none,
                          ),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide.none,
                          ),
                          title: Text(
                            'How to Add a Driver?',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Luo3Colors.textPrimary,
                            ),
                          ),
                          tilePadding: EdgeInsets.symmetric(horizontal: 16),
                          collapsedIconColor: Luo3Colors.primary,
                          iconColor: Luo3Colors.primary,
                          childrenPadding: EdgeInsets.only(bottom: 8),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Text(
                                'Drinking Mode ensures a safe ride home after a night out. Before drinking, add a trusted driver and activate the mode. A yellow call button appears for quick access. When ready, tap to call your driver instantly. Enjoy your night responsibly, knowing a reliable ride is just one tap away.',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Luo3Colors.textSecondary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
