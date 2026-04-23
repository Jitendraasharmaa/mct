import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubSuperAdminEditInitiationsProvider extends ChangeNotifier {
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

  bool isLoading = false;
  bool isDmAttended = false;

  String? documentId;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void loadInitiationData(Map<String, dynamic> data) {
    documentId = data['id'];

    bookSlNoController.text = data['bookSlNo'] ?? '';
    personNameController.text = data['person'] ?? '';
    ageController.text = data['age'] ?? '';
    genderController.text = data['gender'] ?? '';
    educationController.text = data['education'] ?? '';
    phoneController.text = data['phone'] ?? '';
    introducerController.text = data['introducer'] ?? '';
    guarantorController.text = data['guarantor'] ?? '';
    masterController.text = data['master'] ?? '';
    templeController.text = data['temple'] ?? '';
    englishDateController.text = data['englishDate'] ?? '';
    chineseDateController.text = data['chineseDate'] ?? '';
    meritsFeeController.text = data['meritsFee'] ?? '';
    addressController.text = data['address'] ?? '';
    remarksController.text = data['remarks'] ?? '';

    dmAttendedController.text = data['dmAttended'] ?? '';
    isDmAttended = dmAttendedController.text.trim().isNotEmpty;

    notifyListeners();
  }

  Future<String?> updateInitiation() async {
    try {
      if (documentId == null) {
        return 'Invalid initiation record';
      }

      setLoading(true);

      await FirebaseFirestore.instance
          .collection('initiations')
          .doc(documentId)
          .update({
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
            'remarks': remarksController.text.trim(),
            'dmAttended': isDmAttended ? dmAttendedController.text.trim() : '',
            'updatedAt': FieldValue.serverTimestamp(),
          });

      return 'Initiation updated successfully';
    } catch (e) {
      debugPrint('Update initiation error: $e');
      return 'Failed to update initiation';
    } finally {
      setLoading(false);
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
