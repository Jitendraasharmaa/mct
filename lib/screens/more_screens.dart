import 'package:flutter/material.dart';
import 'package:mct_prayer_book/admins/auth/stream_signIn_screen.dart';
import 'package:mct_prayer_book/wigets/card_shadow_widget.dart';

class MoreScreens extends StatelessWidget {
  const MoreScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Padding(
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
                          'Explore More',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CardShadowWidget(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Admin Login",
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Access is restricted to administrators only.",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => StreamSignInScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(
                            isDark ? 0.20 : 0.12,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(
                              isDark ? 0.35 : 0.25,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
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
