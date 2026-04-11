import 'package:flutter/material.dart';
import 'package:mct_prayer_book/screens/sutras/Cing_thien_ti_shen_cou_screen.dart';
import 'package:mct_prayer_book/screens/sutras/mi_lek_Ciu_khu_cen_cing.dart';
import 'package:mct_prayer_book/screens/sutras/pai_siao_cing_screen.dart';
import 'package:mct_prayer_book/screens/sutras/sin_ming_se_screen.dart';

import '../wigets/prayer_cards.dart';

class SutraScreen extends StatelessWidget {
  const SutraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final categories = ['All', 'Morning', 'Evening', 'Healing'];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sutras',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                            height: 1,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          'SACRED RECITATIONS',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Optional category chips
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: categories.map((category) {
              //       return Container(
              //         margin: const EdgeInsets.only(right: 10),
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 16,
              //           vertical: 8,
              //         ),
              //         decoration: BoxDecoration(
              //           color: theme.cardColor,
              //           borderRadius: BorderRadius.circular(20),
              //           border: Border.all(color: theme.dividerColor),
              //         ),
              //         child: Text(
              //           category,
              //           style: TextStyle(
              //             color: theme.colorScheme.onSurface,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       );
              //     }).toList(),
              //   ),
              // ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    PrayerCard(
                      title: 'Mi Lek Ciu Khu Cen Cing',
                      subtitle: 'Chinese · English · Hindi',
                      preview: 'Sutra of Maitreya salvation from suffering',
                      duration: '2:15',
                      progress: 0.55,
                      isFavorite: true,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const MiLekCiuKhuCenCingScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 18),

                    PrayerCard(
                      title: 'Pai Siao Cing',
                      subtitle: 'Chinese · English · Hindi',
                      preview:
                          'Sutra of filial piety - The root of all virtue is to love and respect our parents.',
                      duration: '3:42',
                      progress: 0.15,
                      isFavorite: false,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const PaiSiaoCingScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 18),

                    PrayerCard(
                      title: 'Cing Tien Ti Shen Cou',
                      subtitle: 'Chinese · English · Hindi',
                      preview:
                          'A sacred recitation for seeking blessings, protection, and peace.',
                      duration: '3:42',
                      progress: 0.15,
                      isFavorite: false,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const CingThienTiShenCouScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 18),

                    PrayerCard(
                      title: 'Sin Ming Se',
                      subtitle: 'Chinese · English · Hindi',
                      preview:
                          'Heart Sutra - teaches that a good heart shapes a good destiny.',
                      duration: '3:42',
                      progress: 0.15,
                      isFavorite: false,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SinMingSeScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 24),
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
