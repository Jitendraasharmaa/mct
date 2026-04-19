import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreateAdminProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  Future<String?> createAdmin() async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty) return 'Please enter username';
    if (email.isEmpty) return 'Please enter email';
    if (password.isEmpty) return 'Please enter password';

    try {
      _setLoading(true);

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return 'Sub Super Admin not logged in';
      }

      final subSuperAdminUid = currentUser.uid;

      // Fetch sub super admin details
      final subSuperAdminDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(subSuperAdminUid)
          .get();

      final subSuperAdminData = subSuperAdminDoc.data();

      if (subSuperAdminData == null) {
        return 'Unable to fetch Sub Super Admin details';
      }

      final subSuperAdminUsername = subSuperAdminData['username'] ?? '';

      // Create a secondary Firebase app so the current user stays logged in
      final secondaryApp = await Firebase.initializeApp(
        name: 'admin_creation',
        options: Firebase.app().options,
      );

      final secondaryAuth = FirebaseAuth.instanceFor(app: secondaryApp);

      // Create admin account
      final credential = await secondaryAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final adminUid = credential.user!.uid;
      final uniqueId = generateUniqueId();

      // Save admin details in Firestore
      await FirebaseFirestore.instance.collection('users').doc(adminUid).set({
        'username': username,
        'email': email,
        'role': 'admin',
        'uniqueID': uniqueId,
        // Who created this admin
        'createdBy': subSuperAdminUid,
        'createdByUsername': subSuperAdminUsername,

        'createdAt': FieldValue.serverTimestamp(),
      });

      // Cleanup secondary auth instance
      await secondaryAuth.signOut();
      await secondaryApp.delete();

      // Clear fields
      usernameController.clear();
      emailController.clear();
      passwordController.clear();

      return 'Admin account created successfully';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'This email is already in use';

        case 'invalid-email':
          return 'Please enter a valid email';

        case 'weak-password':
          return 'Password must be at least 6 characters';

        default:
          return e.message ?? 'Failed to create admin account';
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
