import 'package:flutter/material.dart';

class RightCommandHeadingWidget extends StatelessWidget {
  final String text;

  const RightCommandHeadingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text.toString(),
        style: TextStyle(
          fontSize: 18,
          color: Colors.deepOrangeAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
