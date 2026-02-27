import 'package:flutter/material.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';

class InfoTextWidget extends StatelessWidget {
  final String text;

  const InfoTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/oops.png", width: 150),
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
