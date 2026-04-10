import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/models/quickItems_model.dart';
import 'package:mct_prayer_book/screens/events_screen.dart';
import 'package:mct_prayer_book/screens/prayer_commands_screen.dart';
import 'package:mct_prayer_book/screens/songs_screens.dart';
import 'package:mct_prayer_book/screens/sutra_screen.dart';
import 'package:mct_prayer_book/wigets/loading_cards_screen.dart';

import '../constants/app_colors.dart';
import '../models/daily_quote.dart';

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

  int selectedIndex = 0;

  final List<QuickAccessItem> quickItems = const [
    QuickAccessItem(icon: '🙏', title: 'Prayers', subtitle: '16 available'),
    QuickAccessItem(icon: '📜', title: 'Sutras', subtitle: '4 available'),
    QuickAccessItem(icon: '🎵', title: 'Holy Songs', subtitle: '0 available'),
    QuickAccessItem(icon: '📣', title: 'Events', subtitle: '0 upcoming'),
  ];

  String getGreeting() {
    final now = DateTime.now().toUtc().add(
      const Duration(hours: 5, minutes: 30),
    );
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'GOOD MORNING';
    } else if (hour >= 12 && hour < 17) {
      return 'GOOD AFTERNOON';
    } else {
      return 'GOOD EVENING';
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

  @override
  Widget build(BuildContext context) {
    final todayTeaching = getTodayTeaching();
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _refreshScreen,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 18, 22, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NAMASTE · ${getGreeting()}',
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 15,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Maitreya\nCharitable Trust',
                  style: GoogleFonts.notoSerifGeorgian(
                    color: AppColors.primaryText,
                    fontSize: 38,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: AppColors.border),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.star, size: 24, color: AppColors.gold),
                    ),
                    Expanded(
                      child: Container(height: 1, color: AppColors.border),
                    ),
                  ],
                ),
                StreamBuilder<DatabaseEvent>(
                  stream: FirebaseDatabase.instance
                      .ref("dailyTeachings")
                      .onValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingCard();
                    }

                    if (!snapshot.hasData ||
                        snapshot.data!.snapshot.value == null) {
                      return const Center(child: Text("No quote found"));
                    }

                    final rawData = snapshot.data!.snapshot.value;

                    if (rawData is! Map) {
                      return const Center(child: Text("Invalid data format"));
                    }
                    final data = Map<String, dynamic>.from(rawData);
                    // Convert all daily teachings into a list
                    final quotes = data.entries.map((entry) {
                      return Map<String, dynamic>.from(entry.value);
                    }).toList();

                    if (quotes.isEmpty) {
                      return const Center(child: Text("No quotes available"));
                    }
                    // Pick one quote based on today's day
                    final today = DateTime.now().day;
                    // Example:
                    // day 1 -> index 0
                    // day 2 -> index 1
                    // repeats automatically if more days than quotes
                    final index = (today - 1) % quotes.length;
                    final todayQuote = quotes[index];
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'DAILY TEACHING',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      letterSpacing: 1.5,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Icon(
                                    Icons.auto_stories_outlined,
                                    color: AppColors.whiteColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                todayQuote["quote"] ?? "",
                                style: GoogleFonts.notoSerifGeorgian(
                                  color: AppColors.whiteColor,
                                  fontSize: 24,
                                  height: 1.45,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 14),
                              Text(
                                "- ${todayQuote["author"] ?? ""}",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 28),
                Text(
                  'QUICK ACCESS',
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 15,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 18),
                GridView.builder(
                  itemCount: quickItems.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.18,
                  ),
                  itemBuilder: (context, index) {
                    final item = quickItems[index];
                    return GestureDetector(
                      onTap: () => _openScreen(context, index),
                      // onTap: () {
                      //   if (index == 0) {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) => PrayerCommandsScreen(),
                      //       ),
                      //     );
                      //   }
                      // },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                color: AppColors.background,
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
                                color: AppColors.primaryText,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.subtitle,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: LoadingCard(),
                      );
                    }
                    if (!snapshot.hasData ||
                        snapshot.data?.snapshot.value == null) {
                      return const Text('No event data found');
                    }
                    final rawData = snapshot.data!.snapshot.value;
                    if (rawData is! Map) {
                      return const Text('Invalid data format');
                    }
                    final programs = Map<String, dynamic>.from(rawData);
                    // Get first child (p1)
                    final firstProgram = Map<String, dynamic>.from(
                      programs.values.first as Map,
                    );

                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: AppColors.orange,
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
                                  style: const TextStyle(
                                    color: AppColors.primaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${firstProgram['templeName'] ?? ''} · ${firstProgram['time'] ?? ''}',
                                  style: const TextStyle(
                                    color: AppColors.secondaryText,
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
