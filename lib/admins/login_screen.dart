import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/admins/initiation_main_screen.dart';
import 'package:mct_prayer_book/wigets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary.withOpacity(
                        isDark ? 0.18 : 0.12,
                      ),
                    ),
                    child: Icon(
                      Icons.lock_outline_rounded,
                      size: 42,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Center(
                  child: Text(
                    'Admin Access',
                    style: GoogleFonts.notoSerifGeorgian(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Sign in to continue to Maitreya Charitable Trust',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),

                const SizedBox(height: 32),

                InputFieldWidget(
                  controller: _emailController,
                  labelText: 'Email or Username',
                  hintText: 'Enter username or email ID',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email or username';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10.0),

                InputFieldWidget(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter password',
                  obscureText: _obscurePassword,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                // Row(
                //   children: [
                //     Transform.scale(
                //       scale: 0.95,
                //       child: Checkbox(
                //         value: _rememberMe,
                //         activeColor: theme.colorScheme.primary,
                //         onChanged: (value) {
                //           setState(() {
                //             _rememberMe = value ?? false;
                //           });
                //         },
                //       ),
                //     ),
                //     // Text(
                //     //   'Remember me',
                //     //   style: TextStyle(
                //     //     color: theme.textTheme.bodyMedium?.color,
                //     //   ),
                //     // ),
                //     const Spacer(),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Forgot Password?',
                //         style: TextStyle(
                //           color: theme.colorScheme.primary,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 18),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => InitiationMainScreen(),
                        ),
                      );
                      // if (_formKey.currentState!.validate()) {
                      //   // login logic
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      elevation: isDark ? 0 : 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Row(
                //   children: [
                //     Expanded(child: Divider(color: theme.dividerColor)),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 14),
                //       child: Text(
                //         'OR',
                //         style: TextStyle(
                //           color: theme.textTheme.bodyMedium?.color,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ),
                //     Expanded(child: Divider(color: theme.dividerColor)),
                //   ],
                // ),
                //
                // const SizedBox(height: 24),

                // Row(
                //   children: [
                //     Expanded(
                //       child: OutlinedButton.icon(
                //         onPressed: () {},
                //         icon: const Icon(Icons.g_mobiledata_rounded, size: 28),
                //         label: const Text('Google'),
                //         style: OutlinedButton.styleFrom(
                //           minimumSize: const Size.fromHeight(54),
                //           side: BorderSide(color: theme.dividerColor),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16),
                //           ),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 14),
                //     // Expanded(
                //     //   child: OutlinedButton.icon(
                //     //     onPressed: () {},
                //     //     icon: const Icon(Icons.facebook_rounded),
                //     //     label: const Text('Facebook'),
                //     //     style: OutlinedButton.styleFrom(
                //     //       minimumSize: const Size.fromHeight(54),
                //     //       side: BorderSide(color: theme.dividerColor),
                //     //       shape: RoundedRectangleBorder(
                //     //         borderRadius: BorderRadius.circular(16),
                //     //       ),
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),

                // const SizedBox(height: 30),

                // Center(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "Don't have an account? ",
                //         style: TextStyle(
                //           color: theme.textTheme.bodyMedium?.color,
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Text(
                //           'Sign Up',
                //           style: TextStyle(
                //             color: theme.colorScheme.primary,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
