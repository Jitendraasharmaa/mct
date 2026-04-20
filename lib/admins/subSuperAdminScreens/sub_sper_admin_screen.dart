import 'package:flutter/material.dart';
import 'package:mct_prayer_book/admins/adminsScreens/admin_profile_details_screen.dart';
import 'package:mct_prayer_book/admins/auth/login_screen.dart';
import 'package:mct_prayer_book/admins/initiation_main_screen.dart';
import 'package:mct_prayer_book/providers/admin_providers/admin_profile_details_provider.dart';
import 'package:mct_prayer_book/providers/sign_out_provider.dart';
import 'package:mct_prayer_book/screens/events_screen.dart';
import 'package:mct_prayer_book/screens/main_screen.dart';
import 'package:mct_prayer_book/screens/prayer_commands_screen.dart';
import 'package:mct_prayer_book/screens/songs_screens.dart';
import 'package:mct_prayer_book/screens/sutra_screen.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class SubSuperAdminScreen extends StatefulWidget {
  const SubSuperAdminScreen({super.key});

  @override
  State<SubSuperAdminScreen> createState() => SubSuperAdminScreenState();
}

class SubSuperAdminScreenState extends State<SubSuperAdminScreen> {
  Future<void> _refreshScreen() async {
    // Optional delay (for UI effect)
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      // This will rebuild entire screen
      // StreamBuilder will re-listen automatically
    });
  }

  String appVersion = '1.0.0';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminProfileDetailsProvider>().fetchAdmins();
    });
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    if (mounted) {
      setState(() {
        appVersion = packageInfo.version;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final adminProfileProvider = context.read<AdminProfileDetailsProvider>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const AppbarWidget(title: "Dashboard"),
      drawer: buildAppDrawer(context, appVersion),
      body: RefreshIndicator(
        onRefresh: _refreshScreen,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.35,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InitiationMainScreen(),
                    ),
                  );
                },
                child: StatsCard(
                  title: 'Initiation',
                  subtitle: 'Total initiation',
                  value: '1000',
                  colors: [Color(0xFF18C74F), Color(0xFF0DAA3D)],
                  icon: Icons.auto_graph_rounded,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AdminProfileDetailsScreen(),
                    ),
                  );
                },
                child: StatsCard(
                  title: 'Admins',
                  subtitle: 'Number of admins',
                  value: adminProfileProvider.admins.length.toString(),
                  colors: [Color(0xFF4F8CFF), Color(0xFF2D68F0)],
                  icon: Icons.people_alt_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EventsScreen()),
                  );
                },
                child: StatsCard(
                  title: 'Events',
                  subtitle: 'Upcoming events',
                  value: '14',
                  colors: [Color(0xFFFFA726), Color(0xFFF57C00)],
                  icon: Icons.event_available_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String? trailingText;
  final List<Color> colors;
  final IconData icon;

  const StatsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.colors,
    required this.icon,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.82),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 18),
              ),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (trailingText != null) ...[
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    trailingText!,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

Drawer buildAppDrawer(BuildContext context, String appVersion) {
  final themeProvider = context.watch<ThemeProvider>();
  final signOutProvider = context.watch<SignOutProvider>();
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  return Drawer(
    backgroundColor: theme.scaffoldBackgroundColor,
    child: SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withOpacity(0.75),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.white.withOpacity(0.18),
                  child: Image.asset("assets/images/transparentlogo.png"),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Maitreya Charitable Trust',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              children: [
                _drawerItem(
                  context,
                  icon: Icons.home_outlined,
                  title: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                    );
                  },
                ),
                _drawerItem(
                  context,
                  icon: Icons.volunteer_activism_outlined,
                  title: 'Prayer Commands',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PrayerCommandsScreen(),
                      ),
                    );
                  },
                ),
                _drawerItem(
                  context,
                  icon: Icons.menu_book_outlined,
                  title: 'Sutras',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SutraScreen()),
                    );
                  },
                ),
                _drawerItem(
                  context,
                  icon: Icons.music_note_outlined,
                  title: 'Holy Songs',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SongsScreens()),
                    );
                  },
                ),
                _drawerItem(
                  context,
                  icon: Icons.event_note_outlined,
                  title: 'Events',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const EventsScreen()),
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Divider(color: theme.dividerColor, thickness: 1),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 10),
                  child: Text(
                    'Preferences',
                    style: TextStyle(
                      color: theme.textTheme.bodySmall?.color,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isDark
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Dark Mode',
                          style: TextStyle(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          context.read<ThemeProvider>().toggleTheme(value);
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                _drawerItem(
                  context,
                  icon: Icons.info_outline_rounded,
                  title: 'About App',
                  onTap: () {},
                ),
                _drawerItem(
                  context,
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {},
                ),
                _drawerItem(
                  context,
                  icon: Icons.logout_rounded,
                  title: signOutProvider.isSigningOut
                      ? 'Logging out...'
                      : 'Logout',
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: signOutProvider.isSigningOut
                      ? () {}
                      : () async {
                          Navigator.pop(context); // close drawer first

                          try {
                            await context.read<SignOutProvider>().signOut();

                            if (!context.mounted) return;

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (!context.mounted) return;

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                                (route) => false,
                              );
                            });
                          } catch (e) {
                            if (!context.mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to sign out: $e')),
                            );
                          }
                        },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Version $appVersion',
              style: TextStyle(
                color: theme.textTheme.bodySmall?.color,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _drawerItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Color? iconColor,
  Color? textColor,
}) {
  final theme = Theme.of(context);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: (iconColor ?? theme.colorScheme.primary).withOpacity(
                    0.12,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor ?? theme.colorScheme.onSurface,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: theme.textTheme.bodySmall?.color,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
