import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maintifix/widgets/cards/card_design.dart';

class MaintenanceRecordCard extends StatelessWidget {
  final String docId;
  final String startDate;
  final String endDate;
  final DateTime time;
  final String maintenanceType;

  const MaintenanceRecordCard({
    super.key,
    required this.docId,
    required this.startDate,
    required this.endDate,
    required this.time,
    required this.maintenanceType,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Dismissible(
      key: Key(docId),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        await firestore.collection('maintenance').doc(docId).delete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Maintenance record deleted')),
        );
      },
      background: Container(
        color: const Color.fromARGB(255, 65, 10, 6),
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      child: CardDesign(
        icon: Icons.car_repair,
        maintifixDate: startDate,
        nextMaintifix: endDate,
        time: time,
        name: maintenanceType,
      ),
    );
  }
}
