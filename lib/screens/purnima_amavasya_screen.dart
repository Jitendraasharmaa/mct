import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';

import '../wigets/left_command_heading_widget.dart'
    show LeftCommandHeadingWidget;
import '../wigets/right_command_heading_widget.dart'
    show RightCommandHeadingWidget;

class PurnimaAmavasyaScreen extends StatelessWidget {
  const PurnimaAmavasyaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Purnima/Amavasya"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RightCommandHeadingWidget(text: "Shang Ce-Li"),
                LeftCommandHeadingWidget(text: "Sia Ce-Li"),
              ],
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
