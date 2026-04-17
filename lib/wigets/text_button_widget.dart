import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const TextButtonWidget({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: theme.dividerColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
