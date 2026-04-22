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
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Fetch all data added under this sub super admin
      final parentSnapshot = await FirebaseFirestore.instance
          .collection('initiations')
          .where('parentAdminUid', isEqualTo: currentUser.uid)
          .get();

      // Fetch data directly created by this sub super admin
      final selfSnapshot = await FirebaseFirestore.instance
          .collection('initiations')
          .where('createdByUid', isEqualTo: currentUser.uid)
          .get();

      // Merge both query results and remove duplicates
      final allDocs = [...parentSnapshot.docs, ...selfSnapshot.docs];

      final uniqueDocs = {for (var doc in allDocs) doc.id: doc}.values.toList();

      // Optional: sort by createdAt descending
      uniqueDocs.sort((a, b) {
        final aTime = a.data()['createdAt'] as Timestamp?;
        final bTime = b.data()['createdAt'] as Timestamp?;

        if (aTime == null && bTime == null) return 0;
        if (aTime == null) return 1;
        if (bTime == null) return -1;

        return bTime.compareTo(aTime);
      });

      _initiations = uniqueDocs.map((doc) {
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
          'createdByUid': data['createdByUid'] ?? '',
          'createdByUsername': data['createdByUsername'] ?? '',
          'parentAdminUid': data['parentAdminUid'] ?? '',
          'createdAt': data['createdAt'],
          'updatedAt': data['updatedAt'],
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
