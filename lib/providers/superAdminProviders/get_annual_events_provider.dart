import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GetAnnualEventsProvider extends ChangeNotifier {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  bool _isLoading = false;
  String? _error;
  List<Map<String, dynamic>> _listEvents = [];

  bool get loading => _isLoading;

  String? get error => _error;

  List<Map<String, dynamic>> get listEvents => _listEvents;

  Future<void> fetchAllEvents() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final QuerySnapshot snapshot = await _fireStore
          .collection("annualEvents")
          .orderBy("dateTime", descending: true)
          .get();

      _listEvents = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'docId': doc.id,
          'eventname': data['eventname'],
          'place': data['place'],
          'dateTime': data['dateTime'],
        };
      }).toList();
    } catch (e) {
      _error = e.toString();
      debugPrint('Error fetching initiations: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteEvent(String docId) async {
    try {
      await _fireStore.collection("annualEvents").doc(docId).delete();
      _listEvents.removeWhere((event) => event['docId'] == docId);

      notifyListeners();
    } catch (e) {
      _error = e.toString();
      debugPrint('Error deleting event: $e');
      notifyListeners();
    }
  }
}
