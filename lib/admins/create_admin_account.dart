import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/wigets/Elevated_button_widget.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';

import '../wigets/input_field_widget.dart';

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
    return Scaffold(
      appBar: AppbarWidget(title: "Admin Account"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0, vertical: 30),
          child: Form(
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
                  child: ElevatedButtonWidget(onTap: () {}, text: ("Create")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
