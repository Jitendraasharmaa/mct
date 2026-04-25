import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminLoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> loginAdmin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty) {
      return 'Please enter email';
    }

    if (password.isEmpty) {
      return 'Please enter password';
    }

    try {
      _setLoading(true);

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (!doc.exists) {
        await FirebaseAuth.instance.signOut();
        return 'Account details not found';
      }

      final data = doc.data();

      if (data == null) {
        await FirebaseAuth.instance.signOut();
        return 'Invalid account';
      }

      final role = data['role'];

      // Only allow admin login
      if (role != 'admin') {
        await FirebaseAuth.instance.signOut();

        if (role == 'sub_super_admin') {
          return 'Sub Super Admin cannot login from Admin screen';
        }

        if (role == 'super_admin') {
          return 'Super Admin cannot login from Admin screen';
        }

        return 'You are not authorized as Admin';
      }

      // Optional: clear fields after successful login
      emailController.clear();
      passwordController.clear();

      return null; // success
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'No account found with this email';

        case 'wrong-password':
        case 'invalid-credential':
          return 'Incorrect email and password';

        case 'invalid-email':
          return 'Please enter a valid email';

        case 'user-disabled':
          return 'This account has been disabled';

        case 'too-many-requests':
          return 'Too many attempts. Try again later';

        case 'network-request-failed':
          return 'No internet connection';

        default:
          return e.message ?? 'Login failed';
      }
    } catch (e) {
      return 'Something went wrong: $e';
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
