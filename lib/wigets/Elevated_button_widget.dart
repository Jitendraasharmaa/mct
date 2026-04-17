import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const ElevatedButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: AppColors.whiteColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
