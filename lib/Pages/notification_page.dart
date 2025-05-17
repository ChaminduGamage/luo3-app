import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luo3_app/theme/colors.dart';

class NotificationProfileTilePage extends StatefulWidget {
  const NotificationProfileTilePage({super.key});

  @override
  State<NotificationProfileTilePage> createState() =>
      _NotificationProfileTilePageState();
}

class _NotificationProfileTilePageState
    extends State<NotificationProfileTilePage> {
  List<int> expandedTiles = [];

  void toggleTile(int index) {
    setState(() {
      if (expandedTiles.contains(index)) {
        expandedTiles.remove(index);
      } else {
        expandedTiles.add(index);
      }
    });
  }

  void deleteNotification(int index) {
    setState(() {
      expandedTiles.remove(index);
      // In real use, remove from list
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Notification $index deleted",
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Luo3Colors.textPrimary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Profile-style AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                  const SizedBox(width: 100),
                  Text(
                    'Notifications',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Luo3Colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildNotificationTile(
                    index,
                    "Notification Title $index",
                    "This is a detailed notification message that starts short but expands when the dropdown is clicked. You can use this area to show more content like timestamps, actions, or extended details.",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile(int index, String title, String description) {
    final isExpanded = expandedTiles.contains(index);

    // Trimmed description if not expanded
    final previewText = description.length > 80 && !isExpanded
        ? "${description.substring(0, 80)}..."
        : description;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: const Icon(
                Icons.notifications,
                color: Luo3Colors.primary,
                size: 30,
              ),
              title: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Luo3Colors.textPrimary,
                ),
              ),
              subtitle: Text(
                previewText,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Luo3Colors.textSecondary,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Luo3Colors.textPrimary,
                ),
                onPressed: () => toggleTile(index),
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      description,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Luo3Colors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Luo3Colors.primary, width: 1.5),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Luo3Colors.primary,
                        size: 20,
                      ),
                      label: Text(
                        "Delete Notification",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Luo3Colors.primary,
                        ),
                      ),
                      onPressed: () => deleteNotification(index),
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
