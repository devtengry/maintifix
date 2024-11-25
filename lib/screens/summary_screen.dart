import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';
import 'package:maintifix/constants/fonts/project_fonts.dart';
import 'package:maintifix/widgets/card_widgets/card_design.dart';
import 'package:maintifix/widgets/general_widgets/app_bar.dart';
import 'package:maintifix/widgets/general_widgets/floating_button.dart';
import 'package:maintifix/widgets/general_widgets/floating_app_bar.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: ProjectGradientColors.summaryScreenBackroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ProjectAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatingButton(),
        bottomNavigationBar: const BottomAppBarFloating(),
        body: ListView(
          controller: ScrollController(),
          children: [
            CardDesign(
              icon: Icons.car_crash,
              maintifixDate: '25.11.2024',
              nextMaintifix: '25.11.2025',
              name: 'tire',
            ),
          ],
        ),
      ),
    );
  }
}
