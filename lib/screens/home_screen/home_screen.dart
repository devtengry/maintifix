import 'package:flutter/material.dart';

import '../../constants/theme/project_colors.dart';
import '../../services/firebase/maintenance_service.dart';
import '../../widgets/home_widgets/app_bar.dart';
import '../../widgets/home_widgets/floating_app_bar.dart';
import '../../widgets/home_widgets/floating_button.dart';
import '../../widgets/home_widgets/maintenance_stream_builder.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final MaintenanceService _maintenanceService = MaintenanceService();

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
        floatingActionButton: FloatingButton(
          onSave: (String maintenanceType, DateTimeRange dateRange,
              TimeOfDay time) async {
            await _maintenanceService.saveMaintenanceRecord(
                maintenanceType, dateRange, time, context);
          },
        ),
        bottomNavigationBar: const BottomAppBarFloating(),
        body: const MaintenanceStreamBuilder(),
      ),
    );
  }
}
//asdasd