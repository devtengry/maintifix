import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../constants/fonts/project_text_styles.dart';
import '../../constants/theme/project_colors.dart';

class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const String appBarText = 'Mantifix';

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
          onPressed: () async {
            try {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            } catch (e) {}
          },
          icon: const Icon(
            Icons.logout_rounded,
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
