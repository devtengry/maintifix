import 'package:flutter/material.dart';
import 'package:maintifix/widgets/home_widgets/modal_bottom_sheet.dart';

import '../../constants/theme/project_colors.dart';

class FloatingButton extends StatelessWidget {
  final Function(String, DateTimeRange, TimeOfDay) onSave;

  const FloatingButton({super.key, required this.onSave});

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
        Icons.add_to_photos_rounded,
        color: ProjectColors.iconColor,
        size: 30,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Colors.transparent,
          elevation: 0,
          builder: (BuildContext context) {
            return ModalBottomSheet(onSave: onSave);
          },
        );
      },
    );
  }
}
