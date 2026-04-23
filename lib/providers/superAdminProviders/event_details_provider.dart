import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../models/events_model.dart';

class EventDetailsProvider extends ChangeNotifier {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child(
    'Events',
  );

  List<EventModel> _events = [];

  List<EventModel> get events => _events;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void listenToEvents() {
    _dbRef.onValue.listen((event) {
      final data = event.snapshot.value;

      final List<EventModel> loadedEvents = [];

      if (data != null) {
        final Map map = data as Map;

        map.forEach((key, value) {
          loadedEvents.add(EventModel.fromMap(key, value));
        });
      }

      _events = loadedEvents;
      _isLoading = false;
      notifyListeners();
    });
  }
}
