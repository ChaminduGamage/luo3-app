import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/components/nav_bar.dart';
import 'package:luo3_app/components/secondary_button.dart';
import 'package:luo3_app/theme/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? _selectedRentalDays;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
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
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 700),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const Luo3NavBar(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var tween = Tween(
                                    begin: const Offset(-1.0, 0.0),
                                    end: Offset.zero,
                                  ).chain(CurveTween(curve: Curves.easeInOut));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
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
                        const SizedBox(width: 100),
                        Text(
                          'Booking',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Luo3Colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'When do you need the vehicle?',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Luo3Colors.textPrimary,
                      ),
                    ),
                    TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      availableGestures: AvailableGestures.all,
                      calendarStyle: CalendarStyle(
                        selectedDecoration: const BoxDecoration(
                          color: Luo3Colors.primary,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Luo3Colors.textSecondary.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: const TextStyle(color: Colors.white),
                        todayTextStyle: const TextStyle(color: Colors.black),
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleTextStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Luo3Colors.textPrimary,
                        ),
                        leftChevronIcon: const Icon(Icons.chevron_left,
                            color: Luo3Colors.textPrimary),
                        rightChevronIcon: const Icon(Icons.chevron_right,
                            color: Luo3Colors.textPrimary),
                      ),
                      calendarBuilders: CalendarBuilders(
                        dowBuilder: (context, day) {
                          return Center(
                            child: Text(
                              [
                                'S',
                                'M',
                                'T',
                                'W',
                                'T',
                                'F',
                                'S'
                              ][day.weekday % 7],
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Luo3Colors.primary,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'How long are you renting or hiring?',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Luo3Colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(7, (index) {
                          final int days = index + 1;
                          return _rentalDaysOption(days);
                        })
                          ..add(_rentalDaysOptionOther()),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Note : You have to pay advance to booked the driver or vehicle',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Luo3Colors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // Sticky Button at Bottom
            SizedBox(
              width: double.infinity,
              child: SecondaryButton(
                name: "Book Now",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rentalDaysOption(int days) {
    final bool isSelected = _selectedRentalDays == '$days';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRentalDays = '$days';
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? Luo3Colors.primary : Luo3Colors.inputBackground,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$days',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : Luo3Colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _rentalDaysOptionOther() {
    final bool isSelected = _selectedRentalDays == 'Other';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRentalDays = 'Other';
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? Luo3Colors.primary : Luo3Colors.inputBackground,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Other',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : Luo3Colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
