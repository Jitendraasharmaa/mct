import 'package:flutter/material.dart';

class SingleParaTextWidget extends StatelessWidget {
  final String text;

  const SingleParaTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    );
  }
}
