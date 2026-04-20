import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddInitiationDetailsProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final bookSlNoController = TextEditingController();
  final personNameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final educationController = TextEditingController();
  final phoneController = TextEditingController();
  final introducerController = TextEditingController();
  final guarantorController = TextEditingController();
  final masterController = TextEditingController();
  final templeController = TextEditingController();
  final englishDateController = TextEditingController();
  final chineseDateController = TextEditingController();
  final meritsFeeController = TextEditingController();
  final addressController = TextEditingController();
  final dmAttendedController = TextEditingController();
  final remarksController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String generateUniqueId() {
    final now = DateTime.now();

    final year = now.year.toString().substring(2);
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    return 'mct$year$month$day$hour$minute';
  }

  Future<String?> createInitiation() async {
    try {
      _setLoading(true);

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return 'Admin not logged in';
      }

      final adminUid = currentUser.uid;

      final adminDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(adminUid)
          .get();

      if (!adminDoc.exists) {
        return 'Admin details not found';
      }

      final adminData = adminDoc.data()!;
      final uniqueId = generateUniqueId();
      await FirebaseFirestore.instance.collection('initiations').add({
        'uniqueID': uniqueId,
        'bookSlNo': bookSlNoController.text.trim(),
        'name': personNameController.text.trim(),
        'age': ageController.text.trim(),
        'gender': genderController.text.trim(),
        'education': educationController.text.trim(),
        'phone': phoneController.text.trim(),
        'introducer': introducerController.text.trim(),
        'guarantor': guarantorController.text.trim(),
        'master': masterController.text.trim(),
        'temple': templeController.text.trim(),
        'englishDate': englishDateController.text.trim(),
        'chineseDate': chineseDateController.text.trim(),
        'meritsFee': meritsFeeController.text.trim(),
        'address': addressController.text.trim(),
        'dmAttended': dmAttendedController.text.trim(),
        'remarks': remarksController.text.trim(),
        'createdBy': adminUid,
        'createdByUsername': adminData['username'] ?? '',
        'parentAdminUid': adminData['createdBy'] ?? '',
        'parentAdminUsername': adminData['createdByUsername'] ?? '',

        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      bookSlNoController.clear();
      personNameController.clear();
      ageController.clear();
      genderController.clear();
      educationController.clear();
      phoneController.clear();
      introducerController.clear();
      guarantorController.clear();
      masterController.clear();
      templeController.clear();
      englishDateController.clear();
      chineseDateController.clear();
      meritsFeeController.clear();
      addressController.clear();
      dmAttendedController.clear();
      remarksController.clear();

      return 'Initiation created successfully';
    } catch (e) {
      return 'Failed to create initiation: $e';
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    bookSlNoController.dispose();
    personNameController.dispose();
    ageController.dispose();
    genderController.dispose();
    educationController.dispose();
    phoneController.dispose();
    introducerController.dispose();
    guarantorController.dispose();
    masterController.dispose();
    templeController.dispose();
    englishDateController.dispose();
    chineseDateController.dispose();
    meritsFeeController.dispose();
    addressController.dispose();
    dmAttendedController.dispose();
    remarksController.dispose();
    super.dispose();
  }
}
