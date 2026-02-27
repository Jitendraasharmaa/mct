import 'package:flutter/material.dart';

class LeftCommandTextWidget extends StatelessWidget {
  final String text;

  const LeftCommandTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 12, color: Colors.black));
  }
}
