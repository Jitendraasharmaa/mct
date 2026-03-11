import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';
import 'package:mct_prayer_book/wigets/single_para_text_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class InitationCeremonyScreen extends StatelessWidget {
  const InitationCeremonyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Initiation Ceremony"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I.Offering prasada ceremony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                "II.Ceremony for inviting Holy Beings (Ching Than Li Cie)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RightCommandHeadingWidget(text: "Shang Ce-Li"),
                  LeftCommandHeadingWidget(text: "Sia Ce-Li"),
                ],
              ),
              SizedBox(height: 5.0),
              Text(
                "Ching, Ching Than Ren Sien Siang Ciu Pai Wei",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              RowItemWidget(
                col1: "Cuo Yi, Kuei, ",
                col2: "Sien Siang Wu Cu ",
                col3: " Yi Sien, ….. , Wu Sien",
              ),
              RowItemWidget(
                col1: "Wu Khou Shou",
                col2: "",
                col3: "Yi Khou, …. , Wu Khou Shou",
              ),
              SingleParaTextWidget(text: "Chi, Cuo Yi, Cii Kong Kuei Pan"),
              SingleParaTextWidget(
                text: "Liang Pien Su Li, Cing Thing Ching Than",
              ),
              SizedBox(height: 10),
              SingleParaTextWidget(
                text: "(........Tien Chuan Se read something",
              ),
              SizedBox(height: 10),
              RowItemWidget(
                col1: "Tuei Mian Cuo Yi, Ke Ciu Pai Wei",
                col2: "",
                col3:
                    "Ti Yi Wei, Ti Er Wei, Ti San Wei,Ti Se Wei, Ti Wu Wei, Ti Liu Wei.",
              ),
              SizedBox(height: 15),
              Text(
                "III.The Big Nine-Five Ceremony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              SingleParaTextWidget(text: "Cuo Yi, Kuei"),
              RowItemWidget(
                col1: "Chu Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien, San Sien..",
              ),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Yi Khou,Chai khou, San khou sou..",
              ),
              RowItemWidget(
                col1: "Ya Sien Siang San Cu",
                col2: "",
                col3: "Se Sien,Wu Sien,Liu Sien..",
              ),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Se Khou,Wu khou, Liu khou sou..",
              ),
              RowItemWidget(
                col1: "Cong Sien Siang San Cu",
                col2: "",
                col3: "Chi Sien,Pa Sien,Chiu Sien..",
              ),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Chi Khou,Pa khou, Chiu khou sou..",
              ),
              SingleParaTextWidget(text: "Chi,Cuo Yi,Kuei"),
              RowItemWidget(
                col1: "Sien Siang Wu Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien,Se Sien, Wu Sien..",
              ),
              RowItemWidget(
                col1: "Wu Khou Sou",
                col2: "",
                col3: "Yi khou,Chai khou..Wu khou sou",
              ),
              SizedBox(height: 15.0),
              Text("Notes", style: TextStyle(fontWeight: FontWeight.bold)),
              SingleParaTextWidget(
                text:
                    "In case that the above ceremony had been done before, directly go to the below steps:",
              ),
              SizedBox(height: 15.0),
              RowItemWidget(
                col1: "Cuo Yi, Kuei",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien, Cai Sien...Wu Sien",
              ),
              RowItemWidget(
                col1: "She Khou Shou",
                col2: "",
                col3: "Yi Khou...She Khou Shou",
              ),
              SizedBox(height: 15.0),
              Text(
                "IV.	The Initiations Ceremony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleParaTextWidget(text: "Kuei Tu Sen Ching Ce"),
              SizedBox(height: 10),
              Text(
                "IV.	The Initiations Ceremony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RowItemWidget(
                col1: "(Tien Chuan Se read s.t.) Yi Khou Sou",
                col2: "",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "(Tien Chuan Se read s.t.) Yi Khou Sou",
                col2: "",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "(Tien Chuan Se read s.t.) San Khou Sou",
                col2: "",
                col3: "Yi Khou...San Khou Sou",
              ),
              SizedBox(height: 10),
              SingleParaTextWidget(
                text: "Ching Sin Chiu Tao Jen Ke Ciu Pai Wei",
              ),
              SingleParaTextWidget(text: "(optional) Cuo Yi Kuei"),
              SizedBox(height: 10.0),
              SingleParaTextWidget(
                text:
                    "Cing (Kuei)* Thing Tu Piao (Tien Chuan Se read the Dragon Form)",
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
