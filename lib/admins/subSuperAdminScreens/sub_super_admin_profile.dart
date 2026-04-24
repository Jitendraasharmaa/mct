import 'package:flutter/material.dart';
import 'package:mct_prayer_book/admins/adminsScreens/change_password_screen.dart';
import 'package:mct_prayer_book/providers/subSuperAdminProvider/super_admin_profile_provider.dart';
import 'package:provider/provider.dart';

class SubSuperAdminProfile extends StatefulWidget {
  const SubSuperAdminProfile({super.key});

  @override
  State<SubSuperAdminProfile> createState() => _SubSuperAdminProfileState();
}

class _SubSuperAdminProfileState extends State<SubSuperAdminProfile> {
  @override
  void initState() {
    super.initState();

    /// ✅ Fetch Sub Super Admin Profile
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubSuperAdminProfileProvider>().fetchProfile();
    });
  }

  Widget _infoTile({
    required BuildContext context,
    required IconData icon,
    required String title,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.dividerColor.withOpacity(0.6)),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: theme.colorScheme.primary),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: theme.textTheme.bodyLarge?.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SubSuperAdminProfileProvider>(
      builder: (context, provider, child) {
        /// 🔄 Loading
        if (provider.isLoading) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        final data = provider.profile;

        /// ❌ No Data
        if (data == null) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            body: const Center(child: Text('Profile not found')),
          );
        }

        /// ✅ UI
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Column(
            children: [
              /// 🔷 HEADER
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 210,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.secondary,
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data['username'] ?? 'N/A',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data['role'] ?? '',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// 👤 Avatar
                  Positioned(
                    bottom: -45,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: theme.cardColor,
                      child: Icon(
                        Icons.person,
                        size: 45,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              /// 📄 DETAILS
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      _infoTile(
                        context: context,
                        icon: Icons.badge,
                        title: 'ID: ${data['uniqueID'] ?? ''}',
                      ),
                      _infoTile(
                        context: context,
                        icon: Icons.person,
                        title: data['username'] ?? '',
                      ),
                      _infoTile(
                        context: context,
                        icon: Icons.email,
                        title: data['email'] ?? '',
                      ),

                      // _infoTile(
                      //   context: context,
                      //   icon: Icons.person_add,
                      //   title: 'Created By: ${data['createdBy'] ?? ''}',
                      // ),
                      const Spacer(),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.primary,
                                  theme.colorScheme.secondary,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Change Password',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
