import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mct_prayer_book/providers/add_initiation_details_provider.dart';
import 'package:mct_prayer_book/providers/admin_providers/admin_initiation_details_provider.dart';
import 'package:mct_prayer_book/providers/admin_providers/admin_login_provider.dart';
import 'package:mct_prayer_book/providers/admin_providers/admin_profile_details_provider.dart';
import 'package:mct_prayer_book/providers/admin_providers/create_admin_account_provider.dart';
import 'package:mct_prayer_book/providers/create_sub_admin_provider.dart';
import 'package:mct_prayer_book/providers/sign_out_provider.dart';
import 'package:mct_prayer_book/providers/single_admin_profile_details_provider.dart';
import 'package:mct_prayer_book/providers/sub_super_admin_login_provider.dart';
import 'package:mct_prayer_book/providers/sub_super_admins_details_provider.dart';
import 'package:mct_prayer_book/providers/super_admin_login_provider.dart';
import 'package:mct_prayer_book/providers/theme_provider.dart';
import 'package:mct_prayer_book/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'constants/app_colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => SuperAdminLoginProvider()),
        ChangeNotifierProvider(create: (context) => SignOutProvider()),
        ChangeNotifierProvider(
          create: (context) => CreateSubSuperAdminProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SubSuperAdminsDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SubSuperAdminLoginProvider(),
        ),
        ChangeNotifierProvider(create: (context) => CreateAdminProvider()),
        ChangeNotifierProvider(
          create: (context) => AdminProfileDetailsProvider(),
        ),
        ChangeNotifierProvider(create: (context) => AdminLoginProvider()),
        ChangeNotifierProvider(
          create: (_) => SingleAdminProfileDetailsProvider()..fetchProfile(),
        ),
        ChangeNotifierProvider(create: (_) => AddInitiationDetailsProvider()),
        ChangeNotifierProvider(create: (_) => AdminInitiationDetailsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      // ---------------- LIGHT THEME ----------------
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightAppBar,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        cardColor: AppColors.lightCard,

        dividerColor: AppColors.lightBorder,

        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          surface: AppColors.lightSurface,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: AppColors.lightPrimaryText,
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: AppColors.lightPrimaryText,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: AppColors.lightPrimaryText, fontSize: 18),
          bodyMedium: TextStyle(
            color: AppColors.lightSecondaryText,
            fontSize: 16,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.lightBottomNav,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.lightSecondaryText,
        ),

        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
          trackColor: WidgetStateProperty.all(
            AppColors.secondaryColor.withOpacity(0.5),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.lightSurface,
          hintStyle: const TextStyle(color: AppColors.lightSecondaryText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.lightBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
        ),
      ),

      // ---------------- DARK THEME ----------------
      darkTheme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor: AppColors.darkBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkAppBar,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        cardColor: AppColors.darkCard,

        dividerColor: AppColors.darkBorder,

        colorScheme: ColorScheme.dark(
          primary: AppColors.secondaryColor,
          secondary: AppColors.primaryColor,
          surface: AppColors.darkSurface,
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          onSurface: AppColors.darkPrimaryText,
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: AppColors.darkPrimaryText,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: AppColors.darkPrimaryText, fontSize: 18),
          bodyMedium: TextStyle(
            color: AppColors.darkSecondaryText,
            fontSize: 16,
          ),
        ),

        iconTheme: IconThemeData(color: AppColors.secondaryColor),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkBottomNav,
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.darkSecondaryText,
        ),

        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(AppColors.secondaryColor),
          trackColor: WidgetStateProperty.all(
            AppColors.primaryColor.withOpacity(0.6),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkSurface,
          hintStyle: const TextStyle(color: AppColors.darkSecondaryText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.darkBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.darkBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.5),
          ),
        ),
      ),
      home: SplashScreen(),
    );
    // return MaterialApp(
    //
    //   debugShowCheckedModeBanner: false,
    //   title: 'MCT Prayer Book',
    //   home: const SplashScreen(),
    // );
  }
}
