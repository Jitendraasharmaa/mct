import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminProfileDetailsProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Map<String, dynamic>> _admins = [];

  List<Map<String, dynamic>> get admins => _admins;

  Future<void> fetchAdmins() async {
    try {
      _isLoading = true;
      notifyListeners();

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        debugPrint('No logged in user found');
        _admins = [];
        return;
      }

      final currentUserUid = currentUser.uid;

      // Fetch current logged in user's role
      final currentUserDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .get();

      if (!currentUserDoc.exists) {
        debugPrint('Current user document not found');
        _admins = [];
        return;
      }

      final currentUserRole = currentUserDoc.data()?['role'];

      debugPrint('Current User UID: $currentUserUid');
      debugPrint('Current User Role: $currentUserRole');

      Query<Map<String, dynamic>> query = FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'admin');

      // If Sub Super Admin → only fetch admins created by that user
      if (currentUserRole == 'sub_super_admin') {
        query = query.where('createdBy', isEqualTo: currentUserUid);
      }

      // If Super Admin → fetch all admins
      // No extra filter needed

      final snapshot = await query.get();

      _admins = snapshot.docs.map((doc) {
        final data = doc.data();

        return {
          'id': doc.id,
          'username': data['username'] ?? '',
          'role': data['role'] ?? '',
          'email': data['email'] ?? '',
          'uniqueID': data['uniqueID'] ?? '',
          'createdBy': data['createdBy'] ?? '',
          'createdByUsername': data['createdByUsername'] ?? '',
          'createdAt': data['createdAt'],
        };
      }).toList();

      debugPrint('Fetched admins count: ${_admins.length}');
    } catch (e) {
      debugPrint('Error fetching admins: $e');
      _admins = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteAdmin(String adminUid) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(adminUid)
          .delete();

      _admins.removeWhere((admin) => admin['id'] == adminUid);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting admin: $e');
    }
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class AdminProfileDetailsProvider extends ChangeNotifier {
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   List<Map<String, dynamic>> _admins = [];
//
//   List<Map<String, dynamic>> get admins => _admins;
//
//   Future<void> fetchAdmins() async {
//     try {
//       _isLoading = true;
//       notifyListeners();
//
//       final currentUser = FirebaseAuth.instance.currentUser;
//
//       if (currentUser == null) {
//         debugPrint('No logged in sub super admin found');
//         _admins = [];
//         return;
//       }
//
//       final subSuperAdminUid = currentUser.uid;
//
//       debugPrint('Current sub super admin uid: $subSuperAdminUid');
//
//       final snapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .where('role', isEqualTo: 'admin')
//           .where('createdBy', isEqualTo: subSuperAdminUid)
//           .get();
//
//       _admins = snapshot.docs.map((doc) {
//         final data = doc.data();
//
//         return {
//           'id': doc.id,
//           'username': data['username'] ?? '',
//           'role': data['role'] ?? '',
//           'email': data['email'] ?? '',
//           'uniqueID': data['uniqueID'] ?? '',
//           'createdBy': data['createdBy'] ?? '',
//           'createdByUsername': data['createdByUsername'] ?? '',
//           'createdAt': data['createdAt'],
//         };
//       }).toList();
//
//       debugPrint('Fetched admins count: ${_admins.length}');
//     } catch (e) {
//       debugPrint('Error fetching admins: $e');
//       _admins = [];
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   Future<void> deleteAdmin(String adminUid) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(adminUid)
//           .delete();
//
//       _admins.removeWhere((admin) => admin['id'] == adminUid);
//       notifyListeners();
//     } catch (e) {
//       debugPrint('Error deleting admin: $e');
//     }
//   }
// }
