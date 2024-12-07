import 'package:flutter/material.dart';
import 'package:maintifix/widgets/home_widgets/maintenance_selector.dart';
import 'package:maintifix/widgets/home_widgets/save_button.dart';

import '../inputs/date_range_picker.dart';
import '../inputs/time_picker.dart';

class ModalBottomSheet extends StatefulWidget {
  final Function(String, DateTimeRange, TimeOfDay) onSave;

  const ModalBottomSheet({super.key, required this.onSave});

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  String? selectedMaintenance;
  DateTimeRange? selectedDateRange;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 500,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: const Color.fromARGB(255, 17, 40, 40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Maintenance Selector
            MaintenanceSelector(
              onChanged: (value) => selectedMaintenance = value,
            ),
            const SizedBox(height: 20),
            // Date Range Picker
            DateRangePicker(
              onDateSelected: (range) => selectedDateRange = range,
            ),
            const SizedBox(height: 20),
            // Time Picker
            TimePicker(
              onTimeSelected: (time) => selectedTime = time,
            ),
            const Spacer(),
            // Save Button
            SaveButton(
              onSave: () {
                if (selectedMaintenance != null &&
                    selectedDateRange != null &&
                    selectedTime != null) {
                  widget.onSave(
                      selectedMaintenance!, selectedDateRange!, selectedTime!);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
