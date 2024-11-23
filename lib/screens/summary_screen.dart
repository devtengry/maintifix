import 'package:flutter/material.dart';
import 'package:maintifix/constants/project_colors.dart';
import 'package:maintifix/constants/project_text_styles.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String appBarText = 'Here it is...';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: ProjectGradientColors.summaryScreenBackroundColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            appBarText,
            style: ProjectTextStyle.appBarTextStyle,
          ),
          backgroundColor: ProjectColors.summaryAppBarColor,
          toolbarHeight: 100,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
              color: ProjectColors.loginScreenTextColor,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: ProjectColors.buttonColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                color: ProjectColors.floatingActionButtonColor,
                width: 0.5,
              ),
            ),
            child: const Icon(
              Icons.add_to_photos_sharp,
              color: ProjectColors.floatingIconColor,
              size: 30,
            ),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            color: ProjectColors.bottomNavBarColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.car_repair,
                      color: ProjectColors.bottomNavIconColor,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: ProjectColors.bottomNavIconColor,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
