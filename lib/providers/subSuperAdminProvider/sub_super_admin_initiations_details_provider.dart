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

// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class SubSuperAdminInitiationsDetailsProvider extends ChangeNotifier {
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   List<Map<String, dynamic>> _initiations = [];
//
//   List<Map<String, dynamic>> get initiations => _initiations;
//
//   /// ================= FETCH =================
//   Future<void> fetchParentAdminInitiations() async {
//     try {
//       _isLoading = true;
//       notifyListeners();
//
//       final currentUser = FirebaseAuth.instance.currentUser;
//
//       if (currentUser == null) {
//         _initiations = [];
//         return;
//       }
//
//       final parentSnapshot = await FirebaseFirestore.instance
//           .collection('initiations')
//           .where('parentAdminUid', isEqualTo: currentUser.uid)
//           .get();
//
//       final selfSnapshot = await FirebaseFirestore.instance
//           .collection('initiations')
//           .where('createdByUid', isEqualTo: currentUser.uid)
//           .get();
//
//       final allDocs = [...parentSnapshot.docs, ...selfSnapshot.docs];
//       final uniqueDocs = {for (var doc in allDocs) doc.id: doc}.values.toList();
//
//       uniqueDocs.sort((a, b) {
//         final aTime = a.data()['createdAt'] as Timestamp?;
//         final bTime = b.data()['createdAt'] as Timestamp?;
//         if (aTime == null && bTime == null) return 0;
//         if (aTime == null) return 1;
//         if (bTime == null) return -1;
//         return bTime.compareTo(aTime);
//       });
//
//       _initiations = uniqueDocs.map((doc) {
//         final data = doc.data();
//         return {
//           'id': doc.id,
//           'bookSlNo': data['bookSlNo'] ?? '',
//           'uniqueID': data['uniqueID'] ?? '',
//           'person': data['name'] ?? '',
//           'age': data['age'] ?? '',
//           'gender': data['gender'] ?? '',
//           'phone': data['phone'] ?? '',
//           'address': data['address'] ?? '',
//           'education': data['education'] ?? '',
//           'introducer': data['introducer'] ?? '',
//           'guarantor': data['guarantor'] ?? '',
//           'englishDate': data['englishDate'] ?? '',
//           'chineseDate': data['chineseDate'] ?? '',
//           'dmAttended': data['dmAttended'] ?? '',
//           'master': data['master'] ?? '',
//           'temple': data['temple'] ?? '',
//           'meritsFee': data['meritsFee'] ?? '',
//           'remarks': data['remarks'] ?? '',
//           'createdByUsername': data['createdByUsername'] ?? '',
//         };
//       }).toList();
//     } catch (e) {
//       debugPrint('Fetch error: $e');
//       _initiations = [];
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   /// ================= DELETE =================
//   Future<String?> deleteInitiation(String id) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('initiations')
//           .doc(id)
//           .delete();
//
//       _initiations.removeWhere((e) => e['id'] == id);
//       notifyListeners();
//
//       return "Deleted successfully";
//     } catch (e) {
//       return "Delete failed: $e";
//     }
//   }
//
//   /// ================= EXPORT =================
//
//   Future<String?> exportFilteredInitiations({
//     String? temple,
//     String? dmAttended,
//     DateTime? selectedDate,
//     String? searchQuery,
//   }) async {
//     try {
//       _isLoading = true;
//       notifyListeners();
//
//       // 🔐 Request permission
//       var status = await Permission.storage.request();
//       if (!status.isGranted) {
//         return "Storage permission denied";
//       }
//
//       final filtered = _initiations.where((item) {
//         bool match = true;
//
//         if (temple != null && temple != 'All') {
//           match = match && item['temple'] == temple;
//         }
//
//         if (dmAttended != null && dmAttended != 'All') {
//           match = match && item['dmAttended'] == dmAttended;
//         }
//
//         if (searchQuery != null && searchQuery.isNotEmpty) {
//           final q = searchQuery.toLowerCase();
//           match =
//               match &&
//                   (item['person'].toLowerCase().contains(q) ||
//                       item['uniqueID'].toLowerCase().contains(q) ||
//                       item['temple'].toLowerCase().contains(q));
//         }
//
//         return match;
//       }).toList();
//
//       if (filtered.isEmpty) return "No data found";
//
//       List<List<dynamic>> csvData = [
//         ['Name', 'Phone', 'Temple', 'DM', 'Date', 'Address'],
//       ];
//
//       for (var e in filtered) {
//         csvData.add([
//           e['person'],
//           e['phone'],
//           e['temple'],
//           e['dmAttended'],
//           e['englishDate'],
//           e['address'],
//         ]);
//       }
//
//       String csv = csvData
//           .map(
//             (row) => row
//             .map((e) => '"${e.toString().replaceAll('"', '""')}"')
//             .join(','),
//       )
//           .join('\n');
//
//       // 📂 Get Downloads folder
//       final directory = await DownloadsPathProvider.downloadsDirectory;
//
//       final file = File(
//         "${directory!.path}/initiations_${DateTime.now().millisecondsSinceEpoch}.csv",
//       );
//
//       await file.writeAsString(csv);
//
//       return "Saved in Downloads:\n${file.path}";
//     } catch (e) {
//       return "Export failed: $e";
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }