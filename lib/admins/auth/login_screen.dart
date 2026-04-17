import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/admins/super_admin_screen.dart';
import 'package:mct_prayer_book/wigets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  final _superAdminFormKey = GlobalKey<FormState>();
  final _adminFormKey = GlobalKey<FormState>();

  late TabController _tabController;

  final TextEditingController _superEmailController = TextEditingController();
  final TextEditingController _superPasswordController =
      TextEditingController();

  final TextEditingController _adminEmailController = TextEditingController();
  final TextEditingController _adminPasswordController =
      TextEditingController();

  bool _showSuperPassword = true;
  bool _showAdminPassword = true;

  Future<void> _superAdminLogin() async {
    final superAdminEmail = _superEmailController.text.trim();
    final superAdminPassword = _superPasswordController.text.trim();

    // Hide keyboard
    FocusScope.of(context).unfocus();

    // Validate empty fields
    if (superAdminEmail.isEmpty && superAdminPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    if (superAdminEmail.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter email')));
      return;
    }

    if (superAdminPassword.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter password')));
      return;
    }

    // Validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(superAdminEmail)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email')),
      );
      return;
    }

    try {
      // Optional: show loading
      setState(() {
        isLoading = true;
      });

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: superAdminEmail,
        password: superAdminPassword,
      );

      final uid = credential.user!.uid;

      // Check if logged in user is really a super admin
      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);

      // Save user data
      await docRef.set({
        'email': superAdminEmail,
        'role': 'super_admin',
        'createdBy': null,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Read the document back
      final doc = await docRef.get();

      if (!doc.exists) {
        await FirebaseAuth.instance.signOut();

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('User record not found')));
        return;
      }
      final data = doc.data();
      if (data == null || data['role'] == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Role not found')));
        return;
      }
      final role = data['role'];
      if (role != 'super_admin') {
        await FirebaseAuth.instance.signOut();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are not a Super Admin')),
        );
        return;
      }
      // Login successful
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SuperAdminScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'Login failed';

      if (e.code == 'user-not-found') {
        message = 'No account found with this email';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address';
      } else if (e.code == 'user-disabled') {
        message = 'This account has been disabled';
      } else if (e.code == 'too-many-requests') {
        message = 'Too many attempts. Try again later';
      } else if (e.code == 'network-request-failed') {
        message = 'No internet connection';
      } else if (e.code == 'invalid-credential') {
        message = 'Invalid email or password';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Something went wrong: $e')));
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _superEmailController.dispose();
    _superPasswordController.dispose();
    _adminEmailController.dispose();
    _adminPasswordController.dispose();
    super.dispose();
  }

  Widget _buildLoginForm({
    required BuildContext context,
    required String title,
    required String subtitle,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required bool obscurePassword,
    required VoidCallback togglePassword,
    required VoidCallback onLogin,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 18),
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
                Icons.admin_panel_settings_outlined,
                size: 42,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerifGeorgian(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.textTheme.bodyMedium?.color,
                fontSize: 15,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 34),
            InputFieldWidget(
              controller: emailController,
              labelText: 'Email or Username',
              hintText: 'Enter username or email',
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
            const SizedBox(height: 18),
            InputFieldWidget(
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Enter password',
              obscureText: obscurePassword,
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                color: theme.textTheme.bodyMedium?.color,
              ),
              suffixIcon: IconButton(
                onPressed: togglePassword,
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
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    onLogin();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: theme.dividerColor),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: theme.textTheme.bodyMedium?.color,
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: const EdgeInsets.all(6),
                  tabs: const [
                    Tab(text: 'Super Admin'),
                    Tab(text: 'Admin Access'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLoginForm(
                    context: context,
                    title: 'Super Admin Access',
                    subtitle: 'Log in to Maitreya Charitable Trust',
                    formKey: _superAdminFormKey,
                    emailController: _superEmailController,
                    passwordController: _superPasswordController,
                    obscurePassword: _showSuperPassword,
                    togglePassword: () {
                      setState(() {
                        _showSuperPassword = !_showSuperPassword;
                      });
                    },
                    onLogin: () {
                      // _superAdminLogin();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SuperAdminScreen(),
                        ),
                      );
                    },
                  ),
                  _buildLoginForm(
                    context: context,
                    title: 'Admin Access',
                    subtitle: 'Login to Maitreya Charitable Trust',
                    formKey: _adminFormKey,
                    emailController: _adminEmailController,
                    passwordController: _adminPasswordController,
                    obscurePassword: _showAdminPassword,
                    togglePassword: () {
                      setState(() {
                        _showAdminPassword = !_showAdminPassword;
                      });
                    },
                    onLogin: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SuperAdminScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
