import 'package:flutter/material.dart';
import 'package:maintifix/constants/project_colors.dart';
import 'package:maintifix/constants/project_fonts.dart';
import 'package:maintifix/widgets/project_widgets.dart';

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
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: Card(
                color: ProjectColors.cardColor,
                child: SizedBox(
                  height: 200,
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.tire_repair_rounded,
                        size: 80,
                        color: ProjectColors.iconColor,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Name: Tires',
                            style: ProjectFonts().cardFont,
                          ),
                          Text(
                            'Maintifix Date: 23.11.2024',
                            style: ProjectFonts().cardFont,
                          ),
                          Text(
                            'Next Maintifix: 23.11.2024',
                            style: ProjectFonts().cardFont,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
