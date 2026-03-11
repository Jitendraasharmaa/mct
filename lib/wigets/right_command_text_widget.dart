import 'package:flutter/material.dart';

class RightCommandTextWidget extends StatelessWidget {
  final String text;

  const RightCommandTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
