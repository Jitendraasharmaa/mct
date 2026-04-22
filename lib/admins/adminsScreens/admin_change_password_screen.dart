import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../providers/admin_providers/admin_change_password_provider.dart';
import '../../wigets/input_field_widget.dart';

class AdminChangePasswordScreen extends StatefulWidget {
  const AdminChangePasswordScreen({super.key});

  @override
  State<AdminChangePasswordScreen> createState() =>
      _AdminChangePasswordScreenState();
}

class _AdminChangePasswordScreenState extends State<AdminChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final changePasswordProvider = context.watch<AdminChangePasswordProvider>();

    return Scaffold(
      appBar: AppbarWidget(title: "Change Password"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: changePasswordProvider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputFieldWidget(
                  controller: changePasswordProvider.oldPasswordController,
                  labelText: 'Old Password',
                  hintText: "Enter your old password",
                  obscureText: changePasswordProvider.obscureOldPassword,
                  suffixIcon: IconButton(
                    onPressed: changePasswordProvider.toggleOldPassword,
                    icon: Icon(
                      changePasswordProvider.obscureOldPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your old password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                InputFieldWidget(
                  controller: changePasswordProvider.newPasswordController,
                  labelText: 'New Password',
                  hintText: "Enter your new password",
                  obscureText: changePasswordProvider.obscureNewPassword,
                  suffixIcon: IconButton(
                    onPressed: changePasswordProvider.toggleNewPassword,
                    icon: Icon(
                      changePasswordProvider.obscureNewPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a new password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    if (value ==
                        changePasswordProvider.oldPasswordController.text
                            .trim()) {
                      return 'New password cannot be same as old password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                InputFieldWidget(
                  controller: changePasswordProvider.confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: "Confirm your password",
                  obscureText: changePasswordProvider.obscureConfirmPassword,
                  suffixIcon: IconButton(
                    onPressed: changePasswordProvider.toggleConfirmPassword,
                    icon: Icon(
                      changePasswordProvider.obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please confirm your password';
                    }

                    if (value.trim() !=
                        changePasswordProvider.newPasswordController.text
                            .trim()) {
                      return 'Passwords do not match';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: AppColors.whiteColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: changePasswordProvider.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();

                            if (!changePasswordProvider.formKey.currentState!
                                .validate()) {
                              return;
                            }

                            final message = await changePasswordProvider
                                .changePassword();

                            if (!context.mounted) return;

                            final isSuccess =
                                message == 'Password changed successfully';

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  message ??
                                      'Something went wrong. Please try again.',
                                ),
                                backgroundColor: isSuccess
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            );
                          },
                    child: changePasswordProvider.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
