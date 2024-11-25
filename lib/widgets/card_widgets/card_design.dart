import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';
import 'package:maintifix/constants/fonts/project_fonts.dart';

class CardDesign extends StatelessWidget {
  String maintifixDate;
  String nextMaintifix;
  String name;
  IconData icon;

  CardDesign({
    super.key,
    required this.icon,
    required this.maintifixDate,
    required this.nextMaintifix,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: ProjectColors.cardColor,
        child: SizedBox(
          height: 200,
          width: 500,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
