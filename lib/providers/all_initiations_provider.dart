import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllInitiationsProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Map<String, dynamic>> _initiations = [];

  List<Map<String, dynamic>> get initiations => _initiations;

  String? _error;

  String? get error => _error;

  Future<void> fetchAllInitiations() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('initiations')
          .orderBy('createdAt', descending: true)
          .get();

      _initiations = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return {
          'docId': doc.id,
          'name': data['name'] ?? '',
          'age': data['age'] ?? '',
          'gender': data['gender'] ?? '',
          'phone': data['phone'] ?? '',
          'address': data['address'] ?? '',
          'education': data['education'] ?? '',
          'introducer': data['introducer'] ?? '',
          'guarantor': data['guarantor'] ?? '',
          'bookSlNo': data['bookSlNo'] ?? '',
          'master': data['master'] ?? '',
          'temple': data['temple'] ?? '',
          'role': data['role'] ?? '',
          'createdBy': data['createdBy'] ?? '',
          'createdByUsername': data['createdByUsername'] ?? '',
          'parentAdminUid': data['parentAdminUid'] ?? '',
          'parentAdminUsername': data['parentAdminUsername'] ?? '',
          'createdAt': data['createdAt'],
          'englishDate': data['englishDate'] ?? '',
          'chineseDate': data['chineseDate'] ?? '',
          'dmAttended': data['dmAttended'] ?? '',
          'meritsFee': data['meritsFee'] ?? '',
          'remarks': data['remarks'] ?? '',
        };
      }).toList();
    } catch (e) {
      _error = e.toString();
      debugPrint('Error fetching initiations: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> deleteInitiation(String docId) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _firestore.collection('initiations').doc(docId).delete();

      // remove locally after delete
      _initiations.removeWhere((item) => item['docId'] == docId);

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();

      debugPrint('Error deleting initiation: $e');
      return false;
    }
  }
}
