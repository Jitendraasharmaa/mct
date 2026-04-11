import 'package:flutter/material.dart';
import 'package:mct_prayer_book/screens/more_screens.dart';
import 'package:mct_prayer_book/screens/prayer_commands_screen.dart';
import 'package:mct_prayer_book/screens/songs_screens.dart';
import 'package:mct_prayer_book/screens/sutra_screen.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final items = [
      Icons.home_outlined,
      Icons.volunteer_activism_outlined,
      Icons.menu_book_outlined,
      Icons.music_note_outlined,
      Icons.menu,
    ];

    final labels = ['Home', 'Prayers', 'Sutras', 'Songs', 'More'];

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border(
          top: BorderSide(
            color: theme.dividerColor,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.18 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final selected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              if (index == 0) return;

              Widget page;
              switch (index) {
                case 1:
                  page = const PrayerCommandsScreen();
                  break;
                case 2:
                  page = const SutraScreen();
                  break;
                case 3:
                  page = const SongsScreens();
                  break;
                case 4:
                  page = const MoreScreens();
                  break;
                default:
                  page = const SizedBox.shrink();
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => page),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: selected
                    ? theme.colorScheme.primary.withOpacity(
                  isDark ? 0.20 : 0.10,
                )
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[index],
                    size: selected ? 30 : 28,
                    color: selected
                        ? theme.colorScheme.primary
                        : theme.textTheme.bodyMedium?.color,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: selected
                          ? theme.colorScheme.primary
                          : theme.textTheme.bodyMedium?.color,
                      fontSize: 13,
                      fontWeight: selected
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}