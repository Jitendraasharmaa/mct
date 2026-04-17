import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/providers/create_sub_admin_provider.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../wigets/input_field_widget.dart';

class CreateSupSuperAdmin extends StatefulWidget {
  const CreateSupSuperAdmin({super.key});

  @override
  State<CreateSupSuperAdmin> createState() => _CreateSupSuperAdminState();
}

class _CreateSupSuperAdminState extends State<CreateSupSuperAdmin> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final createSubSuperAdminProvider = context
        .watch<CreateSubSuperAdminProvider>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppbarWidget(title: "Sub Super Admin"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0, vertical: 30),
          child: Form(
            key: createSubSuperAdminProvider.formKey,
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
                  "You are creating a new sub super admin",
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
                  controller: createSubSuperAdminProvider.usernameController,
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
                  controller: createSubSuperAdminProvider.emailController,
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
                  controller: createSubSuperAdminProvider.passwordController,
                  labelText: 'Password',
                  hintText: 'Enter Password',
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
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: createSubSuperAdminProvider.isLoading
                        ? null
                        : () async {
                      if (createSubSuperAdminProvider
                          .formKey
                          .currentState!
                          .validate()) {
                        final message = await createSubSuperAdminProvider
                            .createSubSuperAdmin();

                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message ?? 'Done'),
                            backgroundColor:
                            message ==
                                'Sub Super Admin created successfully'
                                ? Colors.green
                                : null,
                          ),
                        );
                      }
                    },
                    child: createSubSuperAdminProvider.isLoading
                        ? SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: theme.colorScheme.primary,
                      ),
                    )
                        : const Text('Create'),
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
