import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/providers/create_admin_account_provider.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../wigets/input_field_widget.dart';

class CreateAdminAccount extends StatefulWidget {
  const CreateAdminAccount({super.key});

  @override
  State<CreateAdminAccount> createState() => _CreateAdminAccountState();
}

class _CreateAdminAccountState extends State<CreateAdminAccount> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final adminCreateProfileProvider = context.watch<CreateAdminProvider>();
    return Scaffold(
      appBar: AppbarWidget(title: "Admin Account"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0, vertical: 30),
          child: Form(
            key: adminCreateProfileProvider.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.primary.withOpacity(
                      isDark ? 0.18 : 0.12,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 42,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerifGeorgian(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "You are creating a new admin",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium?.color,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                InputFieldWidget(
                  labelText: 'userName',
                  hintText: 'Enter Username',
                  controller: adminCreateProfileProvider.usernameController,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter userName';
                    }
                    return null;
                  },
                ),
                InputFieldWidget(
                  labelText: 'Email',
                  hintText: 'Enter Email ID',
                  controller: adminCreateProfileProvider.emailController,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email ID';
                    }
                    return null;
                  },
                ),

                InputFieldWidget(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  controller: adminCreateProfileProvider.passwordController,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
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
                    onPressed: adminCreateProfileProvider.isLoading
                        ? null
                        : () async {
                      if (adminCreateProfileProvider.formKey.currentState!
                          .validate()) {
                        final message = await adminCreateProfileProvider
                            .createAdmin();

                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message ?? ''),
                            backgroundColor:
                            message ==
                                'Admin account created successfully'
                                ? Colors.green
                                : null,
                          ),
                        );
                      }
                    },
                    child: adminCreateProfileProvider.isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : Text(
                      'Create Admin',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
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
