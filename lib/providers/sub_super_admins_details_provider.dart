import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SubSuperAdminsDetailsProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Map<String, dynamic>> _subSuperAdmins = [];

  List<Map<String, dynamic>> get subSuperAdmins => _subSuperAdmins;

  Future<void> fetchSubSuperAdmins() async {
    try {
      _isLoading = true;
      notifyListeners();
      final currentUid = FirebaseAuth.instance.currentUser!.uid;

      print("The currentUId: $currentUid");

      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'sub_super_admin')
          .where('createdBy', isEqualTo: currentUid)
          .get();
      _subSuperAdmins = snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'id': doc.id,
          'uniqueID': data['uniqueID'] ?? '',
          'username': data['username'] ?? '',
          'email': data['email'] ?? '',
          'role': data['role'] ?? '',
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching sub super admins: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteSubSuperAdmin(String userId) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).delete();
    _subSuperAdmins.removeWhere((user) => user['id'] == userId);
    notifyListeners();
  }
}
