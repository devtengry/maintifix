import 'package:flutter/material.dart';

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
