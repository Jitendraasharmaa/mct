import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';
import 'package:mct_prayer_book/wigets/single_para_text_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class FestivalCeremonyScreen extends StatelessWidget {
  const FestivalCeremonyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Pai Cie - Festival Ceremony"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
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
              SingleParaTextWidget(text: "Cuo Yi, Kuei"),
              RowItemWidget(
                col1: "Siang Ming Ming Shang Ti Pai Cie ",
                col2: " Se Khou Shou",
                col3: "Yi Khou...Se Khou Sou",
              ),
              RowItemWidget(
                col1: "Siang Cu Thien Shen Sheng Pai Cie",
                col2: "Wu Khou Shou",
                col3: "Yi Khou...Wu Khou Sou",
              ),
              RowItemWidget(
                col1: "Siang Mi Le Cu Se Pai Cie",
                col2: "Wu Khou Shou",
                col3: "Yi Khou...Wu Khou Sou",
              ),
              RowItemWidget(
                col1: "Siang Nan Hai Ku Fo Pai Cie",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Huo Fo En Se",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Ye Hui Phu Sa",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Ke Wei Fa Li Cu",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Cao Ciin",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Se Cun",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Se Mu",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Ceng Tien Yen Shuai",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Ceng Tien Ciang Ciin",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Ciau Hua Phu Sa",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Ke Wei Ta Sien",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Siang Cin Kong Cu Se Pai Cie",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou..",
              ),
              RowItemWidget(
                col1: "Siang Thien Ran Ku Fo Pai Cie",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou..",
              ),
              RowItemWidget(
                col1: "Siang Cong Hua Shen Mu Pai Cie",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou..",
              ),
              RowItemWidget(
                col1: "Siang Pai Shuei Sheng Ti",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ta Te Cen Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Lien Che Phu Sha",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ke Wei Cheng Tao Chien Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(col1: "Chi,Cuo Yi Kuei", col2: "", col3: ""),
              RowItemWidget(
                col1: "Kei Ke Wei Tien Chuan Se Pai Cie",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              SingleParaTextWidget(
                text: "Chi, Cuo Yi, Pai Cie Li Pi Chuei Shou Ci Kong Thuei",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
