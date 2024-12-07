import 'package:flutter/material.dart';

TimeOfDay? parseTime(String timeString) {
  try {
    final splitTime = timeString.split(' ');
    final timeParts = splitTime[0].split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    if (splitTime.length == 2 &&
        (splitTime[1].toUpperCase() == 'PM' ||
            splitTime[1].toUpperCase() == 'AM')) {
      if (splitTime[1].toUpperCase() == 'PM' && hour != 12) {
        return TimeOfDay(hour: hour + 12, minute: minute);
      } else if (splitTime[1].toUpperCase() == 'AM' && hour == 12) {
        return TimeOfDay(hour: 0, minute: minute);
      } else {
        return TimeOfDay(hour: hour, minute: minute);
      }
    } else {
      return TimeOfDay(hour: hour, minute: minute);
    }
  } catch (e) {
    return null;
  }
}
