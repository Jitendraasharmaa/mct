import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../wigets/loading_cards_screen.dart';
import '../wigets/prayer_cards.dart';

class SutraScreen extends StatelessWidget {
  const SutraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Morning', 'Evening', 'Healing'];

    return Scaffold(
      backgroundColor: AppColors.background,
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
                      children: const [
                        Text(
                          'Sutras',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff2F241C),
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'SACRED RECITATIONS',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView(
                  children: [
                    PrayerCard(
                      title: 'Mi Lek Ciu Khu Cen Cing',
                      subtitle: 'Chinese · English · Hindi',
                      preview: 'Sutra of Maitreya salvation from suffering ',
                      duration: '2:15',
                      progress: 0.55,
                      isFavorite: true,
                    ),
                    SizedBox(height: 18),
                    PrayerCard(
                      title: 'Pai Siao Cing',
                      subtitle: 'Chinese · English · Hindi',
                      preview:
                          'Sutra of filial piety - The root of all virtue is to love and respect our parents.',
                      duration: '3:42',
                      progress: 0.15,
                      isFavorite: false,
                    ),
                    SizedBox(height: 18),
                    LoadingCard(),
                    SizedBox(height: 24),
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
