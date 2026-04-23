import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditEventProvider extends ChangeNotifier {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child(
    'Events',
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  DateTime? selectedDate;
  String? eventId;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setInitialData({
    required String id,
    required String eventName,
    required String templeName,
    required String time,
    required int day,
    required String month,
  }) {
    eventId = id;

    eventNameController.text = eventName;
    placeController.text = templeName;
    timeController.text = time;

    // Convert month + day → Date

    final monthIndex = _getMonthIndex(month);
    selectedDate = DateTime(DateTime.now().year, monthIndex, day);

    dateController.text = DateFormat('dd MMM yyyy').format(selectedDate!);

    notifyListeners();
  }

  // ✅ 2. UPDATE EVENT

  Future<void> updateEvent() async {
    final id = eventId;
    if (id == null) return; // ✅ safe check

    if (!formKey.currentState!.validate() || selectedDate == null) {
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      await _dbRef.child(id).update({
        // ✅ no "!" needed
        'eventName': eventNameController.text.trim(),
        'templeName': placeController.text.trim(),
        'time': timeController.text.trim(),
        'day': selectedDate!.day,
        'month': _getMonthName(selectedDate!.month),
        'date': selectedDate!.toIso8601String(),
      });
    } catch (e) {
      debugPrint("Error updating event: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Helpers
  int _getMonthIndex(String month) {
    const months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC",
    ];
    return months.indexOf(month) + 1;
  }

  String _getMonthName(int month) {
    const months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC",
    ];
    return months[month - 1];
  }

  // Date & Time setters
  void setDate(DateTime date) {
    selectedDate = date;
    dateController.text = DateFormat('dd MMM yyyy').format(date);
    notifyListeners();
  }

  void setTime(TimeOfDay time, BuildContext context) {
    timeController.text = time.format(context);
    notifyListeners();
  }

  @override
  void dispose() {
    eventNameController.dispose();
    placeController.dispose();
    timeController.dispose();
    dateController.dispose();
    super.dispose();
  }
}
