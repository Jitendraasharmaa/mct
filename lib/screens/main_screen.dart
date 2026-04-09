import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';
import 'package:mct_prayer_book/screens/home_screen.dart';
import 'package:mct_prayer_book/screens/more_screens.dart';
import 'package:mct_prayer_book/screens/prayers_screen.dart';
import 'package:mct_prayer_book/screens/songs_screens.dart';
import 'package:mct_prayer_book/screens/sutra_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isConnectedInternet = false;
  StreamSubscription? _internetConnectionStreamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _internetConnectionStreamSubscription = InternetConnection().onStatusChange
        .listen((event) {
          print("The internet is: $event");
          switch (event) {
            case InternetStatus.connected:
              setState(() {
                isConnectedInternet = true;
              });
              break;
            case InternetStatus.disconnected:
              setState(() {
                isConnectedInternet = false;
              });
              break;
            default:
              setState(() {
                isConnectedInternet = false;
              });
              break;
          }
        });
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SutraScreen(),
    PrayersScreen(),
    SongsScreens(),
    MoreScreens(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isConnectedInternet
          ? _screens[_selectedIndex]
          : Center(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                backgroundColor: Colors.white,
                elevation: 12,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.wifi_off_rounded,
                        size: 38,
                        color: Colors.red.shade400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "No Internet Connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Please check your internet connection and try again.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade400,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text(
                          "Try Again",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.primaryText,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.orangeDark,
        unselectedIconTheme: IconThemeData(size: 25),
        selectedIconTheme: IconThemeData(size: 30),
        selectedFontSize: 15,
        backgroundColor: AppColors.primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "Sutra",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism_outlined),
            label: "Prayers",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: "Songs",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "More"),
        ],
      ),
    );
  }
}
