import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SubSuperAdminLoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty) return 'Please enter email';
    if (password.isEmpty) return 'Please enter password';

    try {
      _setLoading(true);

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (!userDoc.exists) {
        await FirebaseAuth.instance.signOut();
        return 'User record not found';
      }

      final data = userDoc.data();

      if (data == null) {
        await FirebaseAuth.instance.signOut();
        return 'Unable to load user data';
      }
      final role = data['role'];
      if (role != 'sub_super_admin') {
        // Immediately remove unauthorized login session
        await FirebaseAuth.instance.signOut();
        return switch (role) {
          'super_admin' => 'Super Admin cannot log in from this screen',
          'admin' => 'Admin cannot log in from this screen',
          _ => 'You are not authorized to log in here',
        };
      }
      emailController.clear();
      passwordController.clear();

      return null; // success
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
        case 'user-not-found':
          return 'Incorrect email and password';

        case 'wrong-password':
          return 'Incorrect password';

        case 'invalid-email':
          return 'Invalid email address';

        case 'user-disabled':
          return 'This account has been disabled';

        case 'network-request-failed':
          return 'No internet connection';

        default:
          return e.message ?? 'Login failed';
      }
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class SubSuperAdminAndAdminLoginProvider extends ChangeNotifier {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//
//   void _setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   /// allowedRole can be:
//   /// 'sub_super_admin'
//   /// 'admin'
//   Future<String?> login({
//     required String allowedRole,
//   }) async {
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();
//
//     if (email.isEmpty) return 'Please enter email';
//     if (password.isEmpty) return 'Please enter password';
//
//     try {
//       _setLoading(true);
//
//       final credential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       final uid = credential.user!.uid;
//
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(uid)
//           .get();
//
//       if (!userDoc.exists) {
//         await FirebaseAuth.instance.signOut();
//         return 'User record not found';
//       }
//
//       final data = userDoc.data();
//
//       if (data == null) {
//         await FirebaseAuth.instance.signOut();
//         return 'Unable to load user data';
//       }
//
//       final role = data['role'];
//
//       // Only allow the requested role
//       if (role != allowedRole) {
//         await FirebaseAuth.instance.signOut();
//
//         if (allowedRole == 'sub_super_admin') {
//           return switch (role) {
//             'admin' => 'Admin cannot log in from this screen',
//             'super_admin' =>
//             'Super Admin cannot log in from this screen',
//             _ => 'Only Sub Super Admin can log in here',
//           };
//         }
//
//         if (allowedRole == 'admin') {
//           return switch (role) {
//             'sub_super_admin' =>
//             'Sub Super Admin cannot log in from this screen',
//             'super_admin' =>
//             'Super Admin cannot log in from this screen',
//             _ => 'Only Admin can log in here',
//           };
//         }
//       }
//
//       emailController.clear();
//       passwordController.clear();
//
//       return null; // success
//     } on FirebaseAuthException catch (e) {
//       switch (e.code) {
//         case 'invalid-credential':
//         case 'user-not-found':
//           return 'Invalid email or password';
//
//         case 'wrong-password':
//           return 'Incorrect password';
//
//         case 'invalid-email':
//           return 'Invalid email address';
//
//         case 'user-disabled':
//           return 'This account has been disabled';
//
//         case 'network-request-failed':
//           return 'No internet connection';
//
//         case 'too-many-requests':
//           return 'Too many attempts. Try again later';
//
//         default:
//           return e.message ?? 'Login failed';
//       }
//     } catch (e) {
//       return 'Something went wrong: $e';
//     } finally {
//       _setLoading(false);
//     }
//   }
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }

//This one must be added in logins screen
// final message = await provider.login(
// allowedRole: 'sub_super_admin',
// );
