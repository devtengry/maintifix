import 'package:flutter/material.dart';

class MaintenanceSelector extends StatelessWidget {
  final ValueChanged<String?> onChanged;

  const MaintenanceSelector({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
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
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Select Maintenance Type",
          hintStyle: TextStyle(
            color: const Color(0xFFCBD5E1),
            fontSize: 16,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        ),
        onChanged: onChanged,
        items: const [
          DropdownMenuItem(
            value: "Oil Change",
            child: Text(
              "Oil Change",
              style: TextStyle(
                color: Color(0xFFCBD5E1),
              ),
            ),
          ),
          DropdownMenuItem(
            value: "Tire Rotation",
            child: Text(
              "Tire Rotation",
              style: TextStyle(
                color: Color(0xFFCBD5E1),
              ),
            ),
          ),
          DropdownMenuItem(
            value: "Brake Inspection",
            child: Text(
              "Brake Inspection",
              style: TextStyle(
                color: Color(0xFFCBD5E1),
              ),
            ),
          ),
        ],
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: const Color(0xFFCBD5E1),
        ),
        dropdownColor: Color(0xFF475569), // Set dropdown menu background color
        selectedItemBuilder: (BuildContext context) {
          return [
            Text(
              "Oil Change", // Example item to select
              style: TextStyle(
                color: Color(0xFFCBD5E1),
              ),
            ),
          ];
        },
      ),
    );
  }
}
