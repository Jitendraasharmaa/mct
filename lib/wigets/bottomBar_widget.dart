import 'package:flutter/material.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';
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
        color: AppColors.bottomNav,
        border: Border(top: BorderSide(color: AppColors.border)),
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

              Navigator.push(context, MaterialPageRoute(builder: (_) => page));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  items[index],
                  size: 28,
                  color: selected ? AppColors.orange : AppColors.primaryText,
                ),
                const SizedBox(height: 4),
                Text(
                  labels[index],
                  style: TextStyle(
                    color: selected
                        ? AppColors.orange
                        : AppColors.secondaryText,
                    fontSize: 13,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColors.orange : Colors.transparent,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
