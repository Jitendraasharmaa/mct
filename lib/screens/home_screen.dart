import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';
import 'package:mct_prayer_book/screens/about_screen.dart';
import 'package:mct_prayer_book/screens/holy_mesages_screen.dart';
import 'package:mct_prayer_book/screens/prayer_commands_screen.dart';
import 'package:mct_prayer_book/screens/setting_screens.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: ""),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final items = [
              {"icon": Symbols.folded_hands_sharp, "text": "Prayer Command"},
              {"icon": Symbols.filter_frames_sharp, "text": "Holy Messages"},
              {"icon": Icons.settings, "text": "Settings"},
              {"icon": Icons.info, "text": "About"},
            ];
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PrayerCommandsScreen(),
                    ),
                  );
                }
                if (index == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HolyMessageScreen(),
                    ),
                  );
                }
                if (index == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingScreens()),
                  );
                }
                if (index == 3) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      items[index]["icon"] as IconData,
                      size: 60,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(height: 10),
                    Text(
                      items[index]["text"].toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
