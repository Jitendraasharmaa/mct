import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SutraTextWidget extends StatelessWidget {
  final String firstRow;
  final String secondRow;
  final String thirdRow;

  const SutraTextWidget({
    super.key,
    this.firstRow = "",
    this.secondRow = "",
    this.thirdRow = "",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (firstRow.isNotEmpty)
            Text(
              firstRow,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerifSc(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
                height: 1.5,
              ),
            ),

          if (secondRow.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              secondRow,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: theme.textTheme.bodyMedium?.color,
                height: 1.5,
              ),
            ),
          ],

          if (thirdRow.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              thirdRow,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: theme.textTheme.bodySmall?.color ??
                    theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ],

          const SizedBox(height: 12),

          Divider(
            color: theme.dividerColor,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}