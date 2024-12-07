import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MaintenanceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save maintenance record to Firestore
  Future<void> saveMaintenanceRecord(
    String maintenanceType,
    DateTimeRange dateRange,
    TimeOfDay time,
    BuildContext context,
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _firestore.collection('maintenance').add({
          'userId': user.uid,
          'maintenanceType': maintenanceType,
          'startDate': dateRange.start.toIso8601String(),
          'endDate': dateRange.end.toIso8601String(),
          'time': time.format(context),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Maintenance record saved')),
        );
      } else {
        throw Exception("User not authenticated");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      print("Error saving maintenance record: $e");
    }
  }

  Future<void> deleteMaintenanceRecord(String recordId) async {
    try {
      await _firestore.collection('maintenance').doc(recordId).delete();
    } catch (e) {
      print("Error deleting maintenance record: $e");
    }
  }
}
