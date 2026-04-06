import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/models/quickItems_model.dart';
import 'package:mct_prayer_book/screens/prayer_commands_screen.dart';

import '../constants/app_colors.dart';
import '../models/daily_quote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<QuickAccessItem> quickItems = const [
    QuickAccessItem(icon: '🙏', title: 'Prayers', subtitle: '16 available'),
    QuickAccessItem(icon: '📜', title: 'Sutras', subtitle: '0 available'),
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

  @override
  Widget build(BuildContext context) {
    final todayTeaching = getTodayTeaching();
    return Scaffold(
      body: SafeArea(
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

              const SizedBox(height: 24),

              Container(
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
                        Icon(
                          Icons.auto_stories_outlined,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      '"${todayTeaching.quote}"',
                      style: GoogleFonts.notoSerifGeorgian(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.45,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      "– ${todayTeaching.author}",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
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
                    onTap: () {
                      if (index == 0) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PrayerCommandsScreen(),
                          ),
                        );
                      }
                    },
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

              Container(
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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '12',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'APR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vesak Dharma Ceremony',
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Main Temple Hall · 10:00 AM',
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 16,
                    //     vertical: 10,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: AppColors.orangeLight,
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: Text(
                    //     'Join',
                    //     style: TextStyle(
                    //       color: AppColors.orangeDark,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   Widget _buildBottomNav() {
//     final items = [
//       Icons.home_outlined,
//       Icons.volunteer_activism_outlined,
//       Icons.menu_book_outlined,
//       Icons.music_note_outlined,
//       Icons.menu,
//     ];
//
//     final labels = ['Home', 'Prayers', 'Sutras', 'Songs', 'More'];
//
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.bottomNav,
//         border: Border(top: BorderSide(color: AppColors.border)),
//       ),
//       padding: const EdgeInsets.only(top: 10, bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: List.generate(items.length, (index) {
//           final selected = selectedIndex == index;
//
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   items[index],
//                   color: selected ? AppColors.orange : AppColors.primaryText,
//                   size: 28,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   labels[index],
//                   style: TextStyle(
//                     color: selected
//                         ? AppColors.orange
//                         : AppColors.secondaryText,
//                     fontSize: 13,
//                     fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Container(
//                   width: 6,
//                   height: 6,
//                   decoration: BoxDecoration(
//                     color: selected ? AppColors.orange : Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
