import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminInitiationDetailsProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Map<String, dynamic>> _initiations = [];

  List<Map<String, dynamic>> get initiations => _initiations;

  Future<void> fetchInitiationsDetails() async {
    try {
      _isLoading = true;
      notifyListeners();

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        _initiations = [];
        return;
      }
      final snapshot = await FirebaseFirestore.instance
          .collection('initiations')
          .where('createdBy', isEqualTo: currentUser.uid)
          // .orderBy('createdAt', descending: true)
          .get();

      _initiations = snapshot.docs.map((doc) {
        final data = doc.data();

        return {
          'id': doc.id,
          'bookSlNo': data['bookSlNo'] ?? '',
          'uniqueID': data['uniqueID'] ?? '',

          'person': data['name'] ?? '',
          'age': data['age'] ?? '',
          'gender': data['gender'] ?? '',
          'phone': data['phone'] ?? '',
          'address': data['address'] ?? '',

          'education': data['education'] ?? '',
          'introducer': data['introducer'] ?? '',
          'guarantor': data['guarantor'] ?? '',

          'englishDate': data['englishDate'] ?? '',
          'chineseDate': data['chineseDate'] ?? '',
          'dmAttended': data['dmAttended'] ?? '',
          'master': data['master'] ?? '',
          'temple': data['temple'] ?? '',
          'meritsFee': data['meritsFee'] ?? '',
          'remarks': data['remarks'] ?? '',
          'createdBy': data['createdBy'] ?? '',
          'createdByUsername': data['createdByUsername'] ?? '',
          'parentAdminUid': data['parentAdminUid'] ?? '',
          'parentAdminUsername': data['parentAdminUsername'] ?? '',
          'createdAt': data['createdAt'],
          'updatedAt': data['updatedAt'],
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching admin initiations: $e');
      _initiations = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
