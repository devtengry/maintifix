import 'package:flutter/material.dart';

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
