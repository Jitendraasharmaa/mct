import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mct_prayer_book/admins/adminsScreens/admin_screen.dart';
import 'package:mct_prayer_book/admins/auth/login_screen.dart';
import 'package:mct_prayer_book/admins/subSuperAdminScreens/sub_sper_admin_screen.dart';
import 'package:mct_prayer_book/admins/superAdmin/super_admin_screen.dart';

class StreamSignInScreen extends StatelessWidget {
  const StreamSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        // Loading while checking auth
        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        // User not logged in
        if (!authSnapshot.hasData) {
          return const LoginScreen();
        }

        final uid = authSnapshot.data!.uid;

        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
          builder: (context, roleSnapshot) {
            // Loading while getting role
            if (roleSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            // If no user document exists
            if (!roleSnapshot.hasData || !roleSnapshot.data!.exists) {
              FirebaseAuth.instance.signOut();

              return const Scaffold(
                body: Center(child: Text('User record not found')),
              );
            }

            final data = roleSnapshot.data!.data() as Map<String, dynamic>;
            final role = data['role'];

            switch (role) {
              case 'super_admin':
                return const SuperAdminScreen();

              case 'sub_super_admin':
                return const SubSuperAdminScreen();

              case 'admin':
                return const AdminScreen();

              default:
                FirebaseAuth.instance.signOut();

                return const Scaffold(
                  body: Center(child: Text('Invalid user role')),
                );
            }
          },
        );
      },
    );
  }
}
