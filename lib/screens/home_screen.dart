import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:mct_prayer_book/models/quickItems_model.dart';
import 'package:mct_prayer_book/screens/events_screen.dart';
import 'package:mct_prayer_book/screens/prayer_commands_screen.dart';
import 'package:mct_prayer_book/screens/songs_screens.dart';
import 'package:mct_prayer_book/screens/sutra_screen.dart';
import 'package:mct_prayer_book/wigets/loading_cards_screen.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../models/daily_quote.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refreshScreen() async {
    // Optional delay (for UI effect)
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      // This will rebuild entire screen
      // StreamBuilder will re-listen automatically
    });
  }

  String getGreeting() {
    final now = DateTime.now().toUtc().add(
      const Duration(hours: 5, minutes: 30),
    );
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  DailyTeaching getTodayTeaching() {
    final now = DateTime.now();
    // Number of days since a fixed starting date
    final startDate = DateTime(2025, 1, 1);
    final difference = now.difference(startDate).inDays;
    // Rotate through all teachings
    final index = difference % teachings.length;
    return teachings[index];
  }

  void _openScreen(BuildContext context, int index) {
    Widget screen;
    switch (index) {
      case 0:
        screen = PrayerCommandsScreen();
        break;
      case 1:
        screen = SutraScreen();
        break;
      case 2:
        screen = SongsScreens();
        break;
      case 3:
        screen = EventsScreen();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  Future<void> _checkForUpdate() async {
    print('Checking for Update!');
    await InAppUpdate.checkForUpdate()
        .then((info) {
          if (mounted) {
            setState(() {
              if (info.updateAvailability ==
                  UpdateAvailability.updateAvailable) {
                print('Update available!');
                _update();
              }
            });
          }
        })
        .catchError((error) {
          print(error.toString());
        });
  }

  void _update() async {
    print('Updating');
    await InAppUpdate.startFlexibleUpdate();
    InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((error) {
      print(error.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkForUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: RefreshIndicator(
          color: theme.colorScheme.primary,
          onRefresh: _refreshScreen,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 18, 22, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Namaste.${getGreeting()}",
                      style: GoogleFonts.notoSerifGeorgian(
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 15,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.light_mode,
                          color: !isDark
                              ? theme.colorScheme.primary
                              : theme.textTheme.bodyMedium?.color,
                        ),
                        Switch(
                          value: themeProvider.isDarkMode,
                          onChanged: (value) {
                            context.read<ThemeProvider>().toggleTheme(value);
                          },
                        ),
                        Icon(
                          Icons.dark_mode,
                          color: isDark
                              ? theme.colorScheme.primary
                              : theme.textTheme.bodyMedium?.color,
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  'Maitreya\nCharitable Trust',
                  style: GoogleFonts.notoSerifGeorgian(
                    color: theme.colorScheme.onSurface,
                    fontSize: 38,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: theme.dividerColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.star,
                        size: 24,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1, color: theme.dividerColor),
                    ),
                  ],
                ),

                StreamBuilder<DatabaseEvent>(
                  stream: FirebaseDatabase.instance
                      .ref("dailyTeachings")
                      .onValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 10),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: theme.dividerColor),
                        ),
                        child: const LoadingCard(),
                      );
                    }

                    if (!snapshot.hasData ||
                        snapshot.data!.snapshot.value == null) {
                      return Center(
                        child: Text(
                          "No quote found",
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      );
                    }

                    final rawData = snapshot.data!.snapshot.value;

                    if (rawData is! Map) {
                      return Center(
                        child: Text(
                          "Invalid data format",
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      );
                    }

                    final data = Map<String, dynamic>.from(rawData);

                    final quotes = data.entries.map((entry) {
                      return Map<String, dynamic>.from(entry.value);
                    }).toList();

                    if (quotes.isEmpty) {
                      return Center(
                        child: Text(
                          "No quotes available",
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      );
                    }

                    final today = DateTime.now().day;
                    final index = (today - 1) % quotes.length;
                    final todayQuote = quotes[index];

                    return Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 10),
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'DAILY TEACHING',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Icon(
                                Icons.auto_stories_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          Text(
                            todayQuote["quote"] ?? "",
                            style: GoogleFonts.notoSerifGeorgian(
                              color: Colors.white,
                              fontSize: 24,
                              height: 1.45,
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          const SizedBox(height: 14),

                          Text(
                            "- ${todayQuote["author"] ?? ""}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),

                Text(
                  'QUICK ACCESS',
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium?.color,
                    fontSize: 15,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                StreamBuilder<DatabaseEvent>(
                  stream: FirebaseDatabase.instance
                      .ref('allevents/year/month')
                      .onValue,
                  builder: (context, snapshot) {
                    int eventTotalLength = 0;

                    if (snapshot.hasData &&
                        snapshot.data!.snapshot.value != null) {
                      final data = Map<String, dynamic>.from(
                        snapshot.data!.snapshot.value as Map,
                      );

                      data.forEach((monthName, monthData) {
                        if (monthData is Map) {
                          eventTotalLength += monthData.keys
                              .where((key) => key.toString().startsWith('e'))
                              .length;
                        }
                      });
                    }

                    final updatedQuickItems = [
                      QuickAccessItem(
                        icon: '🙏',
                        title: 'Prayers',
                        subtitle: '16 available',
                      ),
                      QuickAccessItem(
                        icon: '📜',
                        title: 'Sutras',
                        subtitle: '4 available',
                      ),
                      QuickAccessItem(
                        icon: '🎵',
                        title: 'Holy Songs',
                        subtitle: '0 available',
                      ),
                      QuickAccessItem(
                        icon: '📣',
                        title: 'Events',
                        subtitle: '$eventTotalLength available',
                      ),
                    ];

                    return GridView.builder(
                      itemCount: updatedQuickItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.18,
                          ),
                      itemBuilder: (context, index) {
                        final item = updatedQuickItems[index];

                        return GestureDetector(
                          onTap: () => _openScreen(context, index),
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: theme.dividerColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? theme.colorScheme.surface
                                        : AppColors.lightBackground,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    item.icon,
                                    style: const TextStyle(fontSize: 28),
                                  ),
                                ),

                                const Spacer(),

                                Text(
                                  item.title,
                                  style: GoogleFonts.notoSerifGeorgian(
                                    color: theme.colorScheme.onSurface,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  item.subtitle,
                                  style: TextStyle(
                                    color: theme.textTheme.bodyMedium?.color,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 22),

                StreamBuilder<DatabaseEvent>(
                  stream: FirebaseDatabase.instance.ref('Events').onValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: theme.dividerColor),
                        ),
                        child: const LoadingCard(),
                      );
                    }

                    if (!snapshot.hasData ||
                        snapshot.data?.snapshot.value == null) {
                      return Text(
                        'No event data found',
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      );
                    }

                    final rawData = snapshot.data!.snapshot.value;

                    if (rawData is! Map) {
                      return Text(
                        'Invalid data format',
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      );
                    }
                    final programs = Map<String, dynamic>.from(rawData);
                    final firstProgram = Map<String, dynamic>.from(
                      programs.values.first as Map,
                    );
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: theme.dividerColor),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${firstProgram['day'] ?? '--'}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${firstProgram['month'] ?? '--'}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  firstProgram['eventName']?.toString() ?? '',
                                  style: TextStyle(
                                    color: theme.colorScheme.onSurface,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  '${firstProgram['templeName'] ?? ''} · ${firstProgram['time'] ?? ''}',
                                  style: TextStyle(
                                    color: theme.textTheme.bodyMedium?.color,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
