import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';
import 'package:maintifix/constants/fonts/project_fonts.dart';
import 'package:maintifix/widgets/card_widgets/card_design.dart';
import 'package:maintifix/widgets/general_widgets/app_bar.dart';
import 'package:maintifix/widgets/general_widgets/floating_button.dart';
import 'package:maintifix/widgets/general_widgets/floating_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final MaintenanceService _maintenanceService = MaintenanceService();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: ProjectGradientColors.summaryScreenBackroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ProjectAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButton(
          onSave: (String maintenanceType, DateTimeRange dateRange,
              TimeOfDay time) async {
            await _maintenanceService.saveMaintenanceRecord(
                maintenanceType, dateRange, time, context);
          },
        ),
        bottomNavigationBar: const BottomAppBarFloating(),
        body: const MaintenanceStreamBuilder(),
      ),
    );
  }
}

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
      final user = FirebaseAuth.instance.currentUser; // Get the current user
      if (user != null) {
        await _firestore.collection('maintenance').add({
          'userId': user.uid, // Associate the record with the user
          'maintenanceType': maintenanceType,
          'startDate': dateRange.start.toIso8601String(),
          'endDate': dateRange.end.toIso8601String(),
          'time': time.format(context),
        });
      } else {
        throw Exception("User not authenticated");
      }
    } catch (e) {
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

class MaintenanceStreamBuilder extends StatelessWidget {
  const MaintenanceStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
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

          TimeOfDay? timeOfDay = _parseTime(data['time']);
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

  TimeOfDay? _parseTime(String timeString) {
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
      print("Error parsing time: $e");
      return null;
    }
  }
}

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
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Dismissible(
      key: Key(docId),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        await _firestore.collection('maintenance').doc(docId).delete();
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
