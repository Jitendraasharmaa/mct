import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetCurrentUserDetailsProvider extends ChangeNotifier {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  bool _isLoading = false;
  String? _uid;
  String? _name;
  String? _email;
  String? _role;

  bool get isLoading => _isLoading;

  String? get uid => _uid;

  String? get name => _name;

  String? get email => _email;

  String? get role => _role;

  Future<void> fetchCurrentUserDetails() async {
    if (currentUser == null) {
      _uid = null;
      _name = null;
      _email = null;
      _role = null;
      notifyListeners();
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      if (userDoc.exists) {
        final data = userDoc.data();

        _uid = currentUser!.uid;
        _name = data?['name'] ?? '';
        _email = data?['email'] ?? currentUser!.email ?? '';
        _role = data?['role'] ?? '';
      }
    } catch (e) {
      debugPrint('Error fetching current user details: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearUserData() {
    _uid = null;
    _name = null;
    _email = null;
    _role = null;
    notifyListeners();
  }
}
