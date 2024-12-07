import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';
import 'package:maintifix/constants/fonts/project_fonts.dart';
import 'package:intl/intl.dart'; // Import intl for formatting

class CardDesign extends StatelessWidget {
  final String maintifixDate;
  final String nextMaintifix;
  final DateTime time; // Changed to DateTime for better timezone handling
  final String name;
  final IconData icon;

  CardDesign({
    super.key,
    required this.icon,
    required this.maintifixDate,
    required this.nextMaintifix,
    required this.time,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    // Format time based on user's local timezone
    String formattedTime = DateFormat.Hm().format(time);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: ProjectColors.cardColor,
        child: SizedBox(
          height: 220,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: 80,
                color: ProjectColors.iconColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Name: ',
                        style: ProjectFonts().cardHeaderFont,
                      ),
                      Text(
                        name,
                        style: ProjectFonts().cardFont,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Maintifix Date: ',
                        style: ProjectFonts().cardHeaderFont,
                      ),
                      Text(
                        maintifixDate,
                        style: ProjectFonts().cardFont,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Next Maintifix: ',
                        style: ProjectFonts().cardHeaderFont,
                      ),
                      Text(
                        nextMaintifix,
                        style: ProjectFonts().cardFont,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Time: ', // Updated time display
                        style: ProjectFonts().cardHeaderFont,
                      ),
                      Text(
                        formattedTime,
                        style: ProjectFonts().cardFont,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
