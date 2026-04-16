import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
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
  bool? isConnectedInternet; // null = checking connection
  StreamSubscription<InternetStatus>? _internetConnectionStreamSubscription;

  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SutraScreen(),
    PrayersScreen(),
    SongsScreens(),
    MoreScreens(),
  ];

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();

    _internetConnectionStreamSubscription = InternetConnection().onStatusChange
        .listen((event) {
          if (!mounted) return;

          setState(() {
            isConnectedInternet = event == InternetStatus.connected;
          });
        });
  }

  Future<void> _checkInitialConnection() async {
    try {
      final result = await InternetConnection().hasInternetAccess;

      if (!mounted) return;

      setState(() {
        isConnectedInternet = result;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isConnectedInternet = false;
      });
    }
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNoInternetWidget(
    BuildContext context,
    ThemeData theme,
    bool isDark,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: theme.cardColor,
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
                  color: isDark
                      ? Colors.red.withOpacity(0.15)
                      : Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.wifi_off_rounded,
                  size: 38,
                  color: isDark ? Colors.red.shade300 : Colors.red.shade400,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "No Internet Connection",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Please check your internet connection and try again.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.textTheme.bodyMedium?.color,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _checkInitialConnection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget bodyWidget;

    if (isConnectedInternet == null) {
      bodyWidget = const Center(child: CircularProgressIndicator());
    } else if (isConnectedInternet == true) {
      bodyWidget = _screens[_selectedIndex];
    } else {
      bodyWidget = _buildNoInternetWidget(context, theme, isDark);
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.cardColor,
        elevation: 8,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.textTheme.bodyMedium?.color,
        showUnselectedLabels: true,
        selectedFontSize: 15,
        unselectedFontSize: 13,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 25),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: "Sutra",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism_outlined),
            activeIcon: Icon(Icons.volunteer_activism),
            label: "Prayers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            activeIcon: Icon(Icons.music_note),
            label: "Songs",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "More"),
        ],
      ),
    );
  }
}
