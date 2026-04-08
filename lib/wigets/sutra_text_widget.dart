import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';

class SutraTextWidget extends StatelessWidget {
  String firstRow;
  String secondRow;
  String thirdRow = "";

  SutraTextWidget({
    super.key,
    this.firstRow = "",
    this.secondRow = "",
    this.thirdRow = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          firstRow.toString(),
          style: GoogleFonts.poppins(
            fontSize: 23,
            color: AppColors.primaryText,
            letterSpacing: 2,
          ),
        ),
        Text(
          secondRow.toString(),
          style: TextStyle(
            fontSize: 20,
            color: AppColors.orangeDark,
            letterSpacing: 2,
          ),
        ),
        Text(
          thirdRow.toString(),
          style: TextStyle(
            fontSize: 22,
            color: AppColors.textColor,
            letterSpacing: 2,
          ),
        ),
        Row(
          children: [
            Expanded(child: Container(height: 1, color: AppColors.border)),
            Expanded(child: Container(height: 1, color: AppColors.border)),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
