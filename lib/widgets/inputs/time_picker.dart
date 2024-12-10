import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final ValueChanged<TimeOfDay?> onTimeSelected;

  const TimePicker({super.key, required this.onTimeSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        onTimeSelected(selectedTime);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
              "Select Time",
              style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 16),
            ),
            Icon(
              Icons.access_time,
              color: Color(0xFFCBD5E1),
            ),
          ],
        ),
      ),
    );
  }
}
