import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';

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
            return ModalBottomSheet(
              onSave: onSave,
            );
          },
        );
      },
    );
  }
}

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

class MaintenanceSelector extends StatelessWidget {
  final ValueChanged<String?> onChanged;

  const MaintenanceSelector({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: const Text("Select Maintenance Type"),
      onChanged: onChanged,
      items: const [
        DropdownMenuItem(
          value: "Oil Change",
          child: Text("Oil Change"),
        ),
        DropdownMenuItem(
          value: "Tire Rotation",
          child: Text("Tire Rotation"),
        ),
        DropdownMenuItem(
          value: "Brake Inspection",
          child: Text("Brake Inspection"),
        ),
      ],
    );
  }
}

class DateRangePicker extends StatelessWidget {
  final ValueChanged<DateTimeRange?> onDateSelected;

  const DateRangePicker({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        DateTimeRange? selectedDateRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        onDateSelected(selectedDateRange);
      },
      child: const Text("Select Date Range"),
    );
  }
}

class TimePicker extends StatelessWidget {
  final ValueChanged<TimeOfDay?> onTimeSelected;

  const TimePicker({super.key, required this.onTimeSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        TimeOfDay? selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        onTimeSelected(selectedTime);
      },
      child: const Text("Select Time"),
    );
  }
}

class SaveButton extends StatelessWidget {
  final VoidCallback onSave;

  const SaveButton({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSave,
      child: const Text("Save"),
    );
  }
}
