import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SuperAdminLoginProvider extends ChangeNotifier {
  final superAdminFormKey = GlobalKey<FormState>();

  final TextEditingController superEmailController = TextEditingController();

  final TextEditingController superPasswordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> superAdminLogin() async {
    final email = superEmailController.text.trim();
    final password = superPasswordController.text.trim();

    if (email.isEmpty && password.isEmpty) {
      return 'Please enter email and password';
    }

    if (email.isEmpty) {
      return 'Please enter email';
    }

    if (password.isEmpty) {
      return 'Please enter password';
    }

    final emailRegex = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email';
    }

    try {
      _setLoading(true);

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;

      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);

      // Optional: only create if not exists
      final existingDoc = await docRef.get();

      if (!existingDoc.exists) {
        await docRef.set({
          'email': email,
          'role': 'super_admin',
          'createdBy': null,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      final doc = await docRef.get();

      if (!doc.exists) {
        await FirebaseAuth.instance.signOut();
        return 'User record not found';
      }

      final data = doc.data();

      if (data == null || data['role'] == null) {
        await FirebaseAuth.instance.signOut();
        return 'Role not found';
      }

      if (data['role'] != 'super_admin') {
        await FirebaseAuth.instance.signOut();
        return 'You are not a Super Admin';
      }

      return null; // success
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'No account found with this email';
        case 'wrong-password':
          return 'Incorrect password';
        case 'invalid-email':
          return 'Invalid email address';
        case 'user-disabled':
          return 'This account has been disabled';
        case 'too-many-requests':
          return 'Too many attempts. Try again later';
        case 'network-request-failed':
          return 'No internet connection';
        case 'invalid-credential':
          return 'Invalid email or password';
        default:
          return 'Login failed';
      }
    } catch (e) {
      return 'Something went wrong: $e';
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    superEmailController.dispose();
    superPasswordController.dispose();
    super.dispose();
  }
}
