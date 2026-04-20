import 'package:flutter/material.dart';
import 'package:mct_prayer_book/admins/adminsScreens/add_initiation_as_admin.dart';
import 'package:mct_prayer_book/admins/adminsScreens/admin_profile_screen.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../providers/sign_out_provider.dart';
import '../../providers/theme_provider.dart';
import '../../screens/events_screen.dart';
import '../../screens/main_screen.dart';
import '../../screens/prayer_commands_screen.dart';
import '../../screens/songs_screens.dart';
import '../../screens/sutra_screen.dart';
import '../../wigets/initiation_card_widget.dart';
import '../auth/login_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenScreenState();
}

class _AdminScreenScreenState extends State<AdminScreen> {
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        appVersion = packageInfo.version;
      });
    }
  }

  final TextEditingController _searchController = TextEditingController();
  String selectedTemple = 'All';
  String selectedDm = 'All';

  DateTime? selectedDate;

  final List<InitiationCard> allItems = [
    InitiationCard(
      uniqueID: 'HC26041010',
      bookId: "001",
      personName: 'Jitendra Sharma',
      age: 26,
      gender: "Male",
      education: "BCA",
      phoneNumber: 9838247399,
      introducerName: "Nangendra Thakur",
      guarantorName: "Bishal Rai",
      masterName: "Thu Tien Chuan Shi",
      templeName: 'Kuang Wu',
      iniEnglishDate: '04-09-2026',
      iniChineseDate: '01-01-2026',
      donationFee: 100,
      address: "Baneshow,kathamandu,Nepal,Baneshow,kathamandu,Nepal",
      dmAttended: 'Yes',
      remarks: "Nagendra friend's",
    ),
    InitiationCard(
      uniqueID: 'HC26041012',
      bookId: "002",
      personName: 'Birendra Sharma',
      age: 27,
      gender: "Male",
      education: "Bachelore of computer application",
      phoneNumber: 9838247300,
      introducerName: "Mani Raj Thakur",
      guarantorName: "Gobinda Rai",
      masterName: "Lee Tien Chuan Shi",
      templeName: 'Kuang Wu',
      iniEnglishDate: '04-09-2026',
      iniChineseDate: '01-01-2026',
      donationFee: 100,
      address: "Baneshow,kathamandu,Nepal",
      dmAttended: 'Yes',
      remarks: "Jitendr's brother",
    ),
  ];

  List<InitiationCard> get filteredItems {
    return allItems.where((item) {
      final query = _searchController.text.toLowerCase();

      final matchesSearch =
          item.personName.toLowerCase().contains(query) ||
          item.uniqueID.toLowerCase().contains(query) ||
          item.templeName!.toLowerCase().contains(query);

      final matchesTemple =
          selectedTemple == 'All' || item.templeName == selectedTemple;

      final matchesDm = selectedDm == 'All' || item.dmAttended == selectedDm;

      bool matchesDate = true;

      if (selectedDate != null) {
        final itemDateParts = item.iniEnglishDate!.split('-');

        final itemDate = DateTime(
          int.parse(itemDateParts[2]),
          int.parse(itemDateParts[1]),
          int.parse(itemDateParts[0]),
        );

        matchesDate =
            itemDate.year == selectedDate!.year &&
            itemDate.month == selectedDate!.month &&
            itemDate.day == selectedDate!.day;
      }

      return matchesSearch && matchesTemple && matchesDm && matchesDate;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddInitiationAsAdmin()),
          );
        },
        child: Icon(Icons.add),
      ),
      drawer: buildAppDrawer(context, appVersion),
      appBar: AppbarWidget(
        title: 'Initiation Details',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AdminProfileScreen()),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Search by name, ID or temple',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: theme.cardColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.dividerColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: theme.dividerColor),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedTemple,
                            isExpanded: true,
                            dropdownColor: theme.cardColor,
                            items: const [
                              DropdownMenuItem(
                                value: 'All',
                                child: Text(
                                  'Temple',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Hong Ci',
                                child: Text('Hong Ci'),
                              ),
                              DropdownMenuItem(
                                value: 'Kong Ta',
                                child: Text('Kong Ta'),
                              ),
                              DropdownMenuItem(
                                value: 'Yi En',
                                child: Text('Yi En'),
                              ),
                              DropdownMenuItem(
                                value: 'Kuang Ji',
                                child: Text('Kuang Ji'),
                              ),
                              DropdownMenuItem(
                                value: 'Kong Thong',
                                child: Text('Kong Thong'),
                              ),
                              DropdownMenuItem(
                                value: 'Kuang Wu',
                                child: Text('Kuang Wu'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedTemple = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: theme.dividerColor),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedDm,
                            isExpanded: true,
                            dropdownColor: theme.cardColor,
                            items: const [
                              DropdownMenuItem(value: 'All', child: Text('DM')),
                              DropdownMenuItem(
                                value: 'Yes',
                                child: Text('Yes'),
                              ),
                              DropdownMenuItem(value: 'No', child: Text('No')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedDm = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2035),
                          );

                          if (picked != null) {
                            setState(() {
                              selectedDate = picked;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: theme.dividerColor),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 18,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  selectedDate == null
                                      ? 'Date'
                                      : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: selectedDate == null
                                        ? theme.textTheme.bodyMedium?.color
                                        : theme.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        setState(() {
                          selectedTemple = 'All';
                          selectedDm = 'All';
                          selectedDate = null;
                          _searchController.clear();
                        });
                      },
                      child: Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(0.25),
                          ),
                        ),
                        child: Icon(
                          Icons.filter_alt_off_rounded,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text(
                      'No matching records found',
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    itemCount: filteredItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return InitiationCard(
                        uniqueID: item.uniqueID,
                        bookId: 001.toString(),
                        personName: item.personName,
                        age: item.age,
                        gender: item.gender,
                        education: item.education,
                        phoneNumber: item.phoneNumber,
                        introducerName: item.introducerName,
                        guarantorName: item.guarantorName,
                        masterName: item.masterName,
                        templeName: item.templeName,
                        iniEnglishDate: item.iniEnglishDate,
                        iniChineseDate: item.iniChineseDate,
                        donationFee: item.donationFee,
                        address: item.address,
                        dmAttended: item.dmAttended,
                        remarks: item.remarks,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 18,
                ),
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
                                SnackBar(
                                  content: Text('Failed to sign out: $e'),
                                ),
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
}
