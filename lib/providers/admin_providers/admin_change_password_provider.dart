import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminChangePasswordProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool obscureOldPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  void toggleOldPassword() {
    obscureOldPassword = !obscureOldPassword;
    notifyListeners();
  }

  void toggleNewPassword() {
    obscureNewPassword = !obscureNewPassword;
    notifyListeners();
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> changePassword() async {
    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (oldPassword.isEmpty) {
      return 'Please enter old password';
    }

    if (newPassword.isEmpty) {
      return 'Please enter new password';
    }

    if (newPassword.length < 6) {
      return 'New password must be at least 6 characters';
    }

    if (confirmPassword != newPassword) {
      return 'Passwords do not match';
    }

    try {
      _setLoading(true);

      final user = FirebaseAuth.instance.currentUser;

      if (user == null || user.email == null) {
        return 'User not logged in';
      }

      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );

      // Verify old password first
      await user.reauthenticateWithCredential(credential);

      // Update to new password
      await user.updatePassword(newPassword);

      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();

      return 'Password changed successfully';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
        case 'invalid-credential':
          return 'Old password is incorrect';
        case 'weak-password':
          return 'New password is too weak';
        case 'requires-recent-login':
          return 'Please log in again and try';
        default:
          return e.message ?? 'Failed to change password';
      }
    } catch (e) {
      return 'Something went wrong: $e';
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
