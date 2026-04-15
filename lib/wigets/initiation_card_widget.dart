import 'package:flutter/material.dart';

class InitiationCard extends StatelessWidget {
  final String uniqueID;
  final String personName;
  final String dmAttended;
  final String iniEnglishDate;
  final String iniChineseDate;
  final String templeName;

  const InitiationCard({
    super.key,
    required this.uniqueID,
    required this.personName,
    required this.dmAttended,
    required this.iniEnglishDate,
    required this.iniChineseDate,
    required this.templeName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final color = _statusColor(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.dividerColor.withOpacity(0.7)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              theme.brightness == Brightness.dark ? 0.15 : 0.05,
            ),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: theme.dividerColor),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                uniqueID,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              _topIcon(context, Icons.remove_red_eye_outlined),
              const SizedBox(width: 12),
              _topIcon(context, Icons.copy_outlined),
              const SizedBox(width: 12),
              _topIcon(context, Icons.delete_outline),
              const SizedBox(width: 12),
              _topIcon(context, Icons.edit_outlined),
            ],
          ),
          const SizedBox(height: 16),
          _row(context, 'Name', personName),
          _divider(context),
          Row(
            children: [
              SizedBox(
                width: 110,
                child: Text(
                  'Dm Attended',
                  style: TextStyle(
                    color: theme.textTheme.bodySmall?.color,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  // color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: color.withOpacity(0.25)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        // color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      dmAttended,
                      style: TextStyle(
                        // color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _divider(context),
          _row(context, 'English Date', iniEnglishDate, showInfo: true),
          _divider(context),
          _row(context, 'Chinese Date', iniChineseDate, showInfo: true),
          _divider(context),
          _row(context, 'Temple Name', templeName),
          const SizedBox(height: 14),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'View More',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    String value, {
    bool showInfo = false,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: theme.textTheme.bodySmall?.color,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(
        height: 1,
        color: Theme.of(context).dividerColor.withOpacity(0.5),
      ),
    );
  }

  Widget _topIcon(BuildContext context, IconData icon) {
    return Icon(
      icon,
      size: 20,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  // Color _statusColor(BuildContext context) {
  //   switch (inventoryType) {
  //     case InventoryType.stable:
  //       return Colors.green;
  //     case InventoryType.excess:
  //       return Colors.blue;
  //     case InventoryType.low:
  //       return Colors.pinkAccent;
  //   }
  // }
}
