import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class PrayerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String preview;
  final String duration;
  final double progress;
  final bool isFavorite;
  final VoidCallback? onTap;

  const PrayerCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.preview,
    required this.duration,
    required this.progress,
    required this.isFavorite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.18 : 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.labelLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                isFavorite ? Icons.star_border : Icons.star_border,
                color: isFavorite ? Color(0xffBDB3A9) : Color(0xffBDB3A9),
                size: 28,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            preview,
            style: GoogleFonts.notoSerifGeorgian(
              fontSize: 17,
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              // Container(
              //   width: 52,
              //   height: 52,
              //   decoration: const BoxDecoration(
              //     color: AppColors.orange,
              //     shape: BoxShape.circle,
              //   ),
              //   child: const Icon(
              //     Icons.play_arrow_rounded,
              //     color: Colors.white,
              //     size: 34,
              //   ),
              // ),
              // const SizedBox(width: 16),
              // Expanded(
              //   child: Column(
              //     children: [
              //       ClipRRect(
              //         borderRadius: BorderRadius.circular(10),
              //         child: LinearProgressIndicator(
              //           minHeight: 5,
              //           value: progress,
              //           backgroundColor: AppColors.orangeLight,
              //           valueColor: const AlwaysStoppedAnimation(
              //             AppColors.orange,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // const SizedBox(width: 12),
              // Text(
              //   duration,
              //   style: const TextStyle(
              //     fontSize: 15,
              //     fontWeight: FontWeight.w600,
              //     color: AppColors.secondaryText,
              //   ),
              // ),
              // SizedBox(width: 10.0),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.orange.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.orange.withOpacity(0.25)),
                ),
                child: GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Read",
                    style: GoogleFonts.notoSerifGeorgian(
                      fontSize: 16,
                      color: theme.textTheme.labelLarge?.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
