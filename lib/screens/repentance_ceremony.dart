import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';
import 'package:mct_prayer_book/wigets/single_para_text_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class RepentanceCeremony extends StatelessWidget {
  const RepentanceCeremony({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Repentance Ceremony"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "I.Offering Prasada Ceremony",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              "II.Repentance",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              "III.Express Gratitude - Sie En",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 15.0),
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
              col3: "Chien Sien",
            ),
            RowItemWidget(
              col1: "",
              col2: "Se Khou Sou",
              col3: "Yi Khou...Se Khou Shou",
            ),
            RowItemWidget(col1: "Tu Piao", col2: "", col3: "Fen Piao"),
            RowItemWidget(
              col1: "Ming Ming Shang Ti",
              col2: "Yi Chien Khou Shou",
              col3: " Yi,Erl..Ciu,Yi,Yi, Erl..Ciu,Yi Chien Khou Shou",
            ),
            RowItemWidget(
              col1: "Mi Lek Cu Se",
              col2: "San Pai Khou Sou",
              col3: "Yi,Erl..Ciu Yi,Erl..Ciu,San Pai Khou Shou",
            ),
            RowItemWidget(
              col1: "Huo Fo En Se",
              col2: "Yi Pai Khou Sou",
              col3: "Yi,Erl..Ciu Yi,Erl..Ciu,Yi Pai Khou Shou",
            ),
            RowItemWidget(
              col1: "Ye Hui Phu Sa",
              col2: "Yi Pai Khou Sou",
              col3: "Yi,Erl..Ciu Yi,Erl..Ciu,Yi Pai Khou Shou",
            ),
            RowItemWidget(
              col1: "Yen Cang Se Siong",
              col2: "Wu Se Khou Sou",
              col3: " Yi, Erl..Ciu Yi,Erl..Ciu, Wu Se Khou Shou",
            ),
            RowItemWidget(col1: "Chi,Cuo Yi Kuei", col2: "", col3: ""),
            RowItemWidget(
              col1: "Sie Sie Ke Wei Tien Chuan Se",
              col2: "Yi Khou Shou",
              col3: "Yi Khou Shou",
            ),
            SingleParaTextWidget(
              text: "Chi, Cuo Yi, Chan Huei Li Pi Chuei Shou Ci Kong Thuei",
            ),
          ],
        ),
      ),
    );
  }
}
