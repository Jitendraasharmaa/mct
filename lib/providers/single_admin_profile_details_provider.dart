import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingleAdminProfileDetailsProvider extends ChangeNotifier {
  bool isLoading = false;
  Map<String, dynamic>? userData;

  Future<void> fetchProfile() async {
    try {
      isLoading = true;
      notifyListeners();

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) return;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        userData = doc.data();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
