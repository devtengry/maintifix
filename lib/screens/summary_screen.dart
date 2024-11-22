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
            IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined))
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: ProjectColors.buttonColor,
            shape: CircleBorder(),
            onPressed: () {},
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }
}
