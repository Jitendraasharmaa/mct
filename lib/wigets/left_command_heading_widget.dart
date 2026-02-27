import 'package:flutter/material.dart';

class LeftCommandHeadingWidget extends StatelessWidget {
  final String text;

  const LeftCommandHeadingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: 18,
        color: Colors.deepOrangeAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
