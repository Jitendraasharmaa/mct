import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditAnnualEventProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final eventController = TextEditingController();
  final placeController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  bool _isLoading = false;

  bool get loading => _isLoading;

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  String? _docId;

  /// 🔥 Initialize data (VERY IMPORTANT)
  void initData(Map<String, dynamic> event) {
    _docId = event['docId'];

    final DateTime dateTime = (event['dateTime'] as Timestamp).toDate();

    eventController.text = event['eventname'] ?? "";
    placeController.text = event['place'] ?? "";

    selectedDate = dateTime;
    selectedTime = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);

    dateController.text = DateFormat("dd-MM-yyyy").format(dateTime);
    timeController.text = DateFormat('hh:mm a').format(dateTime);

    notifyListeners();
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate = picked;
      dateController.text = DateFormat("dd-MM-yyyy").format(picked);
      notifyListeners();
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      selectedTime = picked;

      final now = DateTime.now();
      final formatted = DateFormat('hh:mm a').format(
        DateTime(now.year, now.month, now.day, picked.hour, picked.minute),
      );

      timeController.text = formatted;
      notifyListeners();
    }
  }

  Future<String?> updateEvent() async {
    if (!formKey.currentState!.validate()) return null;

    if (selectedDate == null || selectedTime == null) {
      return "Select date & time";
    }

    try {
      _setLoading(true);

      final combinedDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      await FirebaseFirestore.instance
          .collection("annualEvents")
          .doc(_docId)
          .update({
            'eventname': eventController.text.trim(),
            'place': placeController.text.trim(),
            'dateTime': combinedDateTime,
          });

      return "Event updated successfully";
    } catch (e) {
      debugPrint("Update error: $e");
      return "Failed to update event";
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    eventController.dispose();
    placeController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }
}
