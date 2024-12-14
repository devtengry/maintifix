import 'package:flutter/material.dart';

import '../../constants/theme/project_colors.dart';

class BottomAppBarFloating extends StatelessWidget {
  const BottomAppBarFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ProjectColors.bottomNavBarColor,
      ),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: BottomAppBar(
        notchMargin: 2.0,
        padding: const EdgeInsets.only(right: 50, left: 50),
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.car_repair,
                  color: ProjectColors.iconColor,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                  color: ProjectColors.iconColor,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/settings');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
