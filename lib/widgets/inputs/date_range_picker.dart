import 'package:flutter/material.dart';

class DateRangePicker extends StatelessWidget {
  final ValueChanged<DateTimeRange?> onDateSelected;

  const DateRangePicker({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check screen width and adjust padding or other values accordingly
        double paddingValue = constraints.maxWidth > 350 ? 16.0 : 12.0;
        double fontSize = constraints.maxWidth > 350 ? 16.0 : 14.0;

        return GestureDetector(
          onTap: () async {
            DateTimeRange? selectedDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            onDateSelected(selectedDateRange);
          },
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: paddingValue, vertical: 14),
            decoration: BoxDecoration(
              color: Color(0xFF475569),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Date Range",
                  style:
                      TextStyle(color: Color(0xFFCBD5E1), fontSize: fontSize),
                ),
                Icon(
                  Icons.calendar_today,
                  color: Color(0xFFCBD5E1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
