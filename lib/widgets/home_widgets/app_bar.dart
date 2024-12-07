import 'package:flutter/material.dart';

import '../../constants/fonts/project_text_styles.dart';
import '../../constants/theme/project_colors.dart';

class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const String appBarText = 'Here it is...';

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text(
        appBarText,
        style: ProjectTextStyle.appBarTextStyle,
      ),
      backgroundColor: ProjectColors.appBarColor,
      toolbarHeight: 100,
      actions: [
        IconButton(
          onPressed: () {
            // Action when the icon is pressed
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 28,
          ),
          color: ProjectColors.textColor,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // Height of the AppBar
}
