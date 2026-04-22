import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/profile_widget.dart';

class AllAdminProfileScreen extends StatefulWidget {
  final String? uniqueID;
  final String? userName;
  final String? role;
  final String? email;
  final String? createdBy;
  final String? joined;

  const AllAdminProfileScreen({
    super.key,
    this.uniqueID,
    this.userName,
    this.role,
    this.email,
    this.createdBy,
    this.joined,
  });

  @override
  State<AllAdminProfileScreen> createState() => _AllAdminProfileScreenState();
}

class _AllAdminProfileScreenState extends State<AllAdminProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ProfileWidget(
      uniqueID: widget.uniqueID,
      userName: widget.userName,
      role: widget.role,
      email: widget.email,
      createdBy: widget.createdBy,
      joined: widget.joined,
    );
  }
}
