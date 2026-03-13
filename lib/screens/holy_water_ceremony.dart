import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';
import 'package:mct_prayer_book/wigets/single_para_text_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class HolyWaterCeremony extends StatelessWidget {
  const HolyWaterCeremony({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Chui Kong Sha - Holy Water Ceremony"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RightCommandHeadingWidget(text: "Shang Ce-Li"),
                  LeftCommandHeadingWidget(text: "Sia Ce-Li"),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            RowItemWidget(
              col1: "Cuo Yi,Kuei",
              col2: "Sien Siang Chien Cu",
              col3: " Chien Sien",
            ),
            RowItemWidget(
              col1: "Ming Ming Shang Ti",
              col2: "Yi Chien Khou Sou",
              col3:
                  "Yi, Erl,San..Ciu,Yi,Er,San..Ciu,Yi,Erl,San..Yi Chien Khou Shou",
            ),
            RowItemWidget(
              col1: "Cu Thien Shen Sheng",
              col2: "Wu Khou Sou",
              col3: "Yi Khou, …, Wu Khou Shou",
            ),
            RowItemWidget(
              col1: "Mi Lek Cu Se",
              col2: "Wu Khou Sou",
              col3: "Yi Khou...Wu Khou Shou",
            ),
            RowItemWidget(
              col1: "Nan Hai Ku Fo",
              col2: "San Khou Sou",
              col3: "Yi Khou,Cai Khou,San Khou Shou",
            ),
            RowItemWidget(
              col1: "Huo Fo En Se",
              col2: "San Khou Sou",
              col3: "Yi Khou,Cai Khou,San Khou Shou",
            ),
            RowItemWidget(
              col1: "Ye Hui Phu Sa",
              col2: "San Khou Sou",
              col3: "Yi Khou,Cai Khou,San Khou Shou",
            ),
            RowItemWidget(
              col1: "Ke Wei Fa Li Cu",
              col2: "San Khou Sou",
              col3: "Yi Khou,Cai Khou,San Khou Shou",
            ),
            RowItemWidget(
              col1: "Ciao Hua Phu Sha",
              col2: "San Khou Sou",
              col3: "Yi Khou,Cai Khou,San Khou Shou",
            ),
            RowItemWidget(
              col1: "Thai Ce Se Siong",
              col2: "San Khou Sou",
              col3: "Yi Khou,Cai Khou,San Khou Shou",
            ),
            SingleParaTextWidget(text: "Chi, Cuo Yi"),
            SingleParaTextWidget(
              text: "Khe Thou Li Pi, Chuei Shou Ci Kong, Thuei",
            ),
          ],
        ),
      ),
    );
  }
}
