import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';
import 'package:mct_prayer_book/wigets/single_para_text_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class HuiSiangTransferMerits extends StatelessWidget {
  const HuiSiangTransferMerits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Hui Siang - Transfer Merits"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "This prayer is done after Dharma Meeting, any Activity, or Amavasya – Poornima",
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
                col1: "Sie Sie Lao Mu Ta Che Ta Pei",
                col2: "Yi Chien Khou Shou",
                col3: "Yi, Erl..Ciu,Yi,Erl..Ciu,  Yi Chien Khou Shou",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Sheng",
                col2: "Wu Khou Sou",
                col3: "Yi Khou, Cai Khou...Wu Khou Shou..",
              ),
              RowItemWidget(
                col1: "Mi Lek Cu Se",
                col2: "Wu Khou Sou",
                col3: "Yi Khou, Cai Khou...Wu Khou Shou..",
              ),
              RowItemWidget(
                col1: "Nan Hai Ku Fo",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Huo Fo En Se",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ye Hui Phu Sa",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ke Wei Fa Li Cu",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Cao Ciin",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Shou..",
              ),
              RowItemWidget(
                col1: "Se Cun",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Shou..",
              ),
              RowItemWidget(
                col1: "Se Mu",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ceng Tien Yen Shuai",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ceng Tien Ciang Ciin",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ciau Hua Phu Sa",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ke Wei Ta Sien",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Shou..",
              ),
              RowItemWidget(
                col1: "Cin Kong Cu Se",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou..",
              ),
              RowItemWidget(
                col1: "Thien Jan Ku Fo",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou..",
              ),
              RowItemWidget(
                col1: "Cong Hua Sheng Mu",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou..",
              ),
              RowItemWidget(
                col1: "Cien Pan Yen Cang",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Hu Fa Ta Sien",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Pai Shui Sheng Ti",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ta Te Cen Ciin",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Lien Che Phu Sha",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(
                col1: "Ke Wei Cheng Tao Chien Sien",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Shou..",
              ),
              RowItemWidget(col1: "Chi, Cuo Yi Kuei", col2: "", col3: ""),
              RowItemWidget(
                col1: "Sie Sie Ke Wei Tien Chuan Se",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Ciang Se",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Ke Wei Pan Se Jen Yen",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              SingleParaTextWidget(
                text: "Chi, Cuo Yi, Sie En Li Pi, Chuei Sou Ci Kung, Thuei",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
