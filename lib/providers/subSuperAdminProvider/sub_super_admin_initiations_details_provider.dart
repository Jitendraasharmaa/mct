import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SubSuperAdminInitiationsDetailsProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Map<String, dynamic>> _initiations = [];

  List<Map<String, dynamic>> get initiations => _initiations;

  Future<void> fetchParentAdminInitiations() async {
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
          .where('parentAdminUid', isEqualTo: currentUser.uid)
          .orderBy('createdAt', descending: true)
          .get();

      _initiations = snapshot.docs.map((doc) {
        final data = doc.data();

        return {
          'id': doc.id,
          'name': data['name'] ?? '',
          'phone': data['phone'] ?? '',
          'address': data['address'] ?? '',
          'createdByUsername': data['createdByUsername'] ?? '',
          'createdAt': data['createdAt'],
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching parent admin initiations: $e');
      _initiations = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> updateInitiation({
    required String documentId,
    required String name,
    required String phone,
    required String address,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('initiations')
          .doc(documentId)
          .update({
            'name': name,
            'phone': phone,
            'address': address,
            'updatedAt': FieldValue.serverTimestamp(),
          });

      await fetchParentAdminInitiations();
      return 'Initiation updated successfully';
    } catch (e) {
      return 'Failed to update initiation: $e';
    }
  }

  Future<String?> deleteInitiation(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('initiations')
          .doc(documentId)
          .delete();

      _initiations.removeWhere((item) => item['id'] == documentId);
      notifyListeners();

      return 'Initiation deleted successfully';
    } catch (e) {
      return 'Failed to delete initiation: $e';
    }
  }
}
