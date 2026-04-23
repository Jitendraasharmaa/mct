import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddAnnualEventProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final eventController = TextEditingController();
  final placeController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  bool _isLoading = false;

  bool get loading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(10000),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      dateController.text = DateFormat("dd-MM-yyyy").format(pickedDate);
      notifyListeners();
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      selectedTime = pickedTime;

      final now = DateTime.now();
      final formatted = DateFormat('hh:mm a').format(
        DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        ),
      );
      timeController.text = formatted;
      notifyListeners();
    }
  }

  String generateUniqueId() {
    final now = DateTime.now();

    final year = now.year.toString().substring(2);
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    return 'e$year$month$day$hour$minute';
  }

  Future<String?> addEvent() async {
    try {
      _setLoading(true);

      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return "Super admin not logged in";
      }

      if (selectedDate == null || selectedTime == null) {
        return "Please select date and time";
      }

      final uniqueId = generateUniqueId();

      // 🔥 Combine date + time
      final combinedDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      await FirebaseFirestore.instance
          .collection("annualEvents")
          .doc(uniqueId)
          .set({
            'uniqueId': uniqueId,
            'eventname': eventController.text.trim(),
            'place': placeController.text.trim(),
            'dateTime': combinedDateTime,
          });

      _clearControllers();
      return "Added event successfully";
    } catch (e) {
      debugPrint("Error of adding event is $e");
      return "Failed to add event";
    } finally {
      _setLoading(false);
    }
  }

  void _clearControllers() {
    eventController.clear();
    placeController.clear();
    dateController.clear();
    timeController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    eventController.dispose();
    placeController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }
}
