import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreateSubSuperAdminProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String? _selectedRole;

  String? get selectedRole => _selectedRole;

  void setRole(String? role) {
    _selectedRole = role;
    notifyListeners();
  }

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _generateUniqueId() {
    final now = DateTime.now();

    final year = (now.year % 100).toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');

    return 'mct$year$month$hour$minute';
  }

  Future<String?> createSubSuperAdmin() async {
    final subSuperAdminUsername = usernameController.text.trim();
    final subSuperAdminEmail = emailController.text.trim();
    final subSuperAdminPassword = passwordController.text.trim();

    if (subSuperAdminUsername.isEmpty) return 'Please enter username';
    if (subSuperAdminEmail.isEmpty) return 'Please enter email';
    if (subSuperAdminPassword.isEmpty) return 'Please enter password';

    if (_selectedRole == null || _selectedRole!.isEmpty) {
      return 'Please select a role';
    }

    try {
      _setLoading(true);

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return 'Super admin not logged in';
      }

      final superAdminUid = currentUser.uid;

      // Generate unique ID
      final uniqueId = _generateUniqueId();

      // Create a secondary Firebase app
      final secondaryApp = await Firebase.initializeApp(
        name: 'Secondary',
        options: Firebase.app().options,
      );
      final secondaryAuth = FirebaseAuth.instanceFor(app: secondaryApp);
      // Create user WITHOUT affecting current logged in super admin
      final credential = await secondaryAuth.createUserWithEmailAndPassword(
        email: subSuperAdminEmail,
        password: subSuperAdminPassword,
      );

      final subSuperAdminUid = credential.user!.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(subSuperAdminUid)
          .set({
            "uniqueID": uniqueId,
            'username': subSuperAdminUsername,
            'email': subSuperAdminEmail,
            'role': _selectedRole,
            'createdBy': superAdminUid,
            'createdAt': FieldValue.serverTimestamp(),
          });

      // Sign out and delete secondary app
      await secondaryAuth.signOut();
      await secondaryApp.delete();

      usernameController.clear();
      emailController.clear();
      passwordController.clear();

      return '${_selectedRole == 'admin' ? 'Admin' : 'Sub Super Admin'} created successfully';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'This email is already in use';
        case 'invalid-email':
          return 'Invalid email address';
        case 'weak-password':
          return 'Password is too weak';
        default:
          return e.message ?? 'Failed to create account';
      }
    } catch (e) {
      return 'Something went wrong: $e';
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
