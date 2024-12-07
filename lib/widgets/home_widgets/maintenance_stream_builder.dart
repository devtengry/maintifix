import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../helpers/time_utils.dart';
import '../cards/maintenance_record_card.dart';

class MaintenanceStreamBuilder extends StatelessWidget {
  const MaintenanceStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection('maintenance')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading data"));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No maintenance records yet"));
        }
        final cards = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;

          DateTime startDate = DateTime.parse(data['startDate']);
          DateTime endDate = DateTime.parse(data['endDate']);
          String formattedStartDate = DateFormat('d.M.y').format(startDate);
          String formattedEndDate = DateFormat('d.M.y').format(endDate);

          TimeOfDay? timeOfDay = parseTime(data['time']);
          DateTime cardTime = DateTime(
            startDate.year,
            startDate.month,
            startDate.day,
            timeOfDay?.hour ?? 0,
            timeOfDay?.minute ?? 0,
          );

          return MaintenanceRecordCard(
            docId: doc.id,
            startDate: formattedStartDate,
            endDate: formattedEndDate,
            time: cardTime,
            maintenanceType: data['maintenanceType'] ?? '',
          );
        }).toList();

        return ListView(children: cards);
      },
    );
  }
}
