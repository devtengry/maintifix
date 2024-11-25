import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ProjectColors.buttonColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: ProjectColors.buttonColor,
          width: 0.5,
        ),
      ),
      child: const Icon(
        Icons.add_to_photos_sharp,
        color: ProjectColors.iconColor,
        size: 30,
      ),
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  child: Column(
                    children: [Text('data')],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
