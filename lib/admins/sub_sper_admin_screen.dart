import 'package:flutter/material.dart';
import 'package:mct_prayer_book/providers/sign_out_provider.dart';
import 'package:provider/provider.dart';

class SubSuperAdminScreen extends StatefulWidget {
  const SubSuperAdminScreen({super.key});

  @override
  State<SubSuperAdminScreen> createState() => _SubSuperAdminScreenState();
}

class _SubSuperAdminScreenState extends State<SubSuperAdminScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<SignOutProvider>(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await provider.signOut();
          },
          child: Text("Sign out"),
        ),
      ),
    );
  }
}
