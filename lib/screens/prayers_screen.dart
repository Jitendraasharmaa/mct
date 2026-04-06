import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PrayersScreen extends StatelessWidget {
  const PrayersScreen({super.key});

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
                          'Prayers',
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
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 22,
                      color: Color(0xff8B7B6E),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // Search Bar
              Container(
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.secondaryText,
                    ),
                    hintText: 'Search prayers...',
                    hintStyle: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 18,
                    ),
                    contentPadding: EdgeInsets.only(top: 15),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Categories
              // SizedBox(
              //   height: 42,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       final isSelected = index == 0;
              //
              //       return Container(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 24,
              //           vertical: 10,
              //         ),
              //         decoration: BoxDecoration(
              //           color: isSelected ? AppColors.orange : Colors.white,
              //           borderRadius: BorderRadius.circular(22),
              //           border: Border.all(
              //             color: isSelected
              //                 ? AppColors.orange
              //                 : AppColors.border,
              //           ),
              //         ),
              //         child: Text(
              //           categories[index],
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600,
              //             color: isSelected
              //                 ? Colors.white
              //                 : AppColors.secondaryText,
              //           ),
              //         ),
              //       );
              //     },
              //     separatorBuilder: (_, __) => const SizedBox(width: 12),
              //     itemCount: categories.length,
              //   ),
              // ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: const [
                    PrayerCard(
                      title: 'Great Compassion Mantra',
                      subtitle: 'Sanskrit · English · Hindi',
                      preview:
                          'Namo ratna trayāya, namo ārya avalokite\nśvarāya bodhisattvāya mahāsattvāya...',
                      duration: '2:15',
                      progress: 0.55,
                      isFavorite: true,
                    ),
                    SizedBox(height: 18),
                    PrayerCard(
                      title: 'Morning Offering Prayer',
                      subtitle: 'English · Chinese',
                      preview:
                          'May all beings be happy, may all beings be\npeaceful, may all beings be free...',
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

class PrayerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String preview;
  final String duration;
  final double progress;
  final bool isFavorite;

  const PrayerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.preview,
    required this.duration,
    required this.progress,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? AppColors.primaryText : Color(0xffBDB3A9),
                size: 28,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            preview,
            style: TextStyle(
              fontSize: 17,
              height: 1.6,
              color: AppColors.primaryText.withOpacity(0.75),
              fontStyle: FontStyle.italic,
              fontFamily: 'Georgia',
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: AppColors.orange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        value: progress,
                        backgroundColor: AppColors.orangeLight,
                        valueColor: const AlwaysStoppedAnimation(
                          AppColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                duration,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18,
            width: 180,
            decoration: BoxDecoration(
              color: AppColors.orangeLight.withOpacity(0.45),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 14,
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.orangeLight.withOpacity(0.45),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 14,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.orangeLight.withOpacity(0.45),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 14,
            width: 240,
            decoration: BoxDecoration(
              color: AppColors.orangeLight.withOpacity(0.45),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
