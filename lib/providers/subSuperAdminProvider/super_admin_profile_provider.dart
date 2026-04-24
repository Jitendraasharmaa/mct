import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SubSuperAdminProfileProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Map<String, dynamic>? _profile;

  Map<String, dynamic>? get profile => _profile;

  String? _error;

  String? get error => _error;

  /// Fetch logged-in sub super admin profile
  Future<void> fetchProfile() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        _error = "User not logged in";
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!doc.exists) {
        _error = "Profile not found";
        return;
      }

      final data = doc.data();

      _profile = {
        'id': doc.id,
        'uniqueID': data?['uniqueID'] ?? '',
        'username': data?['username'] ?? '',
        'email': data?['email'] ?? '',
        'role': data?['role'] ?? '',
        'createdBy': data?['createdBy'] ?? '',
      };
    } catch (e) {
      _error = e.toString();
      debugPrint("Error fetching sub super admin profile: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Optional: Update profile
  Future<void> updateUsername(String username) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
        {'username': username},
      );

      _profile?['username'] = username;
      notifyListeners();
    } catch (e) {
      debugPrint("Error updating username: $e");
    }
  }
}
