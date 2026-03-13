import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';
import 'package:mct_prayer_book/wigets/single_para_text_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class SetUpAltarCeremony extends StatelessWidget {
  const SetUpAltarCeremony({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "An Than Li Cie - Set Up Altar Ceremony"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I.Offering Prasada Ceremony",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "II.Ceremony for inviting Holy Beings (Ching Than Li Cie)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RightCommandHeadingWidget(text: "Shang Ce-Li"),
                    LeftCommandHeadingWidget(text: "Sia Ce-Li"),
                  ],
                ),
              ),
              SingleParaTextWidget(
                text: "Ching, Ching Than Ren Sien Siang Ciu Pai Wei",
              ),
              RowItemWidget(
                col1: "Cuo Yi,Kuei,",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien, Cai Sien...Wu Sien",
              ),
              RowItemWidget(
                col1: "Cuo Yi,Kuei",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien, Cai Sien...Wu Sien",
              ),
              RowItemWidget(
                col1: "",
                col2: "Wu Khou Shou",
                col3: "Yi Khou, Cai Khou...Wu Khou Shou",
              ),
              SingleParaTextWidget(text: "Chi, Cuo Yi, Cii Kong Kuei Pan"),
              SizedBox(height: 5.0),
              SingleParaTextWidget(
                text: "Liang Pien Su Li, Cing Thing Ching Than",
              ),
              SizedBox(height: 5.0),
              SingleParaTextWidget(
                text: "…………… (Tien Chuan Se read something)",
              ),
              RowItemWidget(
                col1: "Tuei Mien Cuo Yi, Ke Ciu Pai Wei",
                col2: "",
                col3:
                    "Ti Yi Wei, Ti Er Wei, Ti San Wei,Ti Se Wei, Ti Wu Wei, Ti Liu Wei",
              ),
              SizedBox(height: 5.0),
              SingleParaTextWidget(text: "Yi Sia Ke Ciu Pai Wei"),
              Text(
                "Cuo Yi, Kuei",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                col1: "",
                col2: "San Khou Sou",
                col3: "Se Khou,Wu khou, Liu khou sou..",
              ),
              RowItemWidget(
                col1: "Cong Sien Siang San Cu",
                col2: "",
                col3: "Chi Sien,Pa Sien,Chiu Sien..",
              ),
              RowItemWidget(
                col1: "",
                col2: "San Khou Sou",
                col3: "Chi Khou,Pa khou, Chiu khou sou..",
              ),
              Text(
                "Chi,Cuo Yi,Kuei",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              RowItemWidget(
                col1: "Sien Siang Wu Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien,Se Sien, Wu Sien..",
              ),
              RowItemWidget(
                col1: "",
                col2: "Wu Khou Sou",
                col3: "Yi khou,Chai khou..Wu khou sou",
              ),
              SizedBox(height: 5.0),
              Text(
                "III.Sien Siang Khe Thou",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien,Cai Sien..Wu Sien",
              ),
              RowItemWidget(
                col1: "Ming Ming Shang Ti",
                col2: "Se Khou Shou",
                col3: "Yi Khou,Cai Khou..Se Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Shen",
                col2: "Ciu Khou Shou",
                col3: "Yi Khou,Cai Khou..Ciu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Mi Le Cu Se",
                col2: "Ciu Khou Shou",
                col3: "Yi Khou,Cai Khou..Ciu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Nan Hai Ku Fo ",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Huo Fo En Se",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ye Hui Phu Sha",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ke Wei Fa Li Cu",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cao Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Se Cun",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Se Mu",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cen Tien Yen Shuai",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Cen Tien Ciang Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Ciao Hua Phu Sa",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Ke Wei Ta Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Lao Chien Jen",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Chien Jen",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Tien Chuan Se",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Yin Pao Se",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Chien Ren Ta Cong",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Ce Ci Cu Sien",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cin Kong Cu Se",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Thien Ran Ku Fo",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cong Hua Sheng Mu",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Pai Shui Sheng Ti",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Ta Te Cen Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Lien Che Phu Sha",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Ke Wei Cheng Tao Chien Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien,San Sien..Wu Sien..",
              ),
              RowItemWidget(
                col1: "Siang Ming Ming Shang Ti An Cuo ",
                col2: " Se Khou Shou",
                col3: "Yi Khou,Cai Khou..Se Khou Shou",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Shen An Cuo",
                col2: " Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wo Khou Shou,",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wo Khou Shou,",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wo Khou Shou,",
              ),
              SizedBox(height: 10.0),
              Text(
                "III.Congratulation Ceremony (Tao Si Li Cie)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 5.0),
              RowItemWidget(col1: "Chi, Cuo Yi Kuei", col2: "", col3: ""),
              RowItemWidget(
                col1: "Siang Ming Ming Shang Ti Tao Si",
                col2: " Se Khou Shou",
                col3: "Yi Khou,Cai Khou..Se Khou Shou",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Shen Tao Si",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: " Mi Le Cu Se Tao Si",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Nan Hai Ku Fo",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Huo Fo En Se",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Ye Hui Phu Sha",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
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
                col1: "Cen Tien Yen Shuai",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Cen Tien Ciang Ciin",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Ciao Hua Phu Sa",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Ke Wei Ta Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Siang Cin Kong Cu Se Tao Si ",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou...Wu Khou Shou",
              ),
              RowItemWidget(
                col1: " Thien Ran Ku Fo Tao Si ",
                col2: " Wu Khou Shou",
                col3: "Yi Khou,Cai Khou...Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Cong Hua Shen Mu Tao Si",
                col2: " Wu Khou Shou",
                col3: "Yi Khou,Cai Khou...Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Pai Shuei Shen Ti",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Ta Te Cen Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Lien Che Phu Sha",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Ke Wei Cheng Tao Chien Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(col1: "Chi,Cuo Yi,Kuei", col2: "", col3: "col3"),
              RowItemWidget(
                col1: "Siang Ke Wei Tien Chuan Se Tao Si",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ming Ming Shang Ti",
                col2: "Se Khou Shou",
                col3: "Yi Khou,Cai Khou...Se Khou Shou",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Shen",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou...Wu Khou Shou",
              ),
              SizedBox(height: 10.0),
              Text(
                "III.	Coming Prayer (Chan Cia)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 5.0),
              RowItemWidget(
                col1: "Chi,Cuo Yi",
                col2: "Tien Chuan Se Yi Sia Kuei",
                col3: "",
              ),
              RowItemWidget(
                col1: "Kei, Ke Wei Tien Chuan Se Chan Cia",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Shou",
              ),
              SingleParaTextWidget(
                text: "Chi, Cuo Yi, Liang Pien Fen Pan, Tuei Mien Cuo Yi",
              ),
              SingleParaTextWidget(
                text: "Ching Than Li Pi Chuei Shou Cii Kong Thuei",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
