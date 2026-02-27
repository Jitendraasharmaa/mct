import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';
import 'package:mct_prayer_book/wigets/info_text_widget.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const InfoTextWidget(text: "There is no profile details"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.whiteColor,
        selectedItemColor: AppColors.secondaryColor,
        unselectedIconTheme: IconThemeData(size: 25),
        selectedIconTheme: IconThemeData(size: 30),
        selectedFontSize: 20,
        backgroundColor: AppColors.primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Symbols.window), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
