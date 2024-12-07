import 'package:flutter/material.dart';

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
