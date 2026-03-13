import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';
import 'package:mct_prayer_book/wigets/single_para_text_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class KhaiPanOpeningClass extends StatelessWidget {
  const KhaiPanOpeningClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Khai Pan - Opening Class"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
              SizedBox(height: 10.0),
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
              SizedBox(height: 15.0),
              SingleParaTextWidget(
                text: "Ching, Ching Than Ren Sien Siang Ciu Pai Wei",
              ),
              RowItemWidget(
                col1: "Cuo Yi,Kuei,",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien, Cai Sien...Wu Sien",
              ),
              RowItemWidget(
                col1: "Wu Khou Shou",
                col2: "",
                col3: "Yi Khou, Cai Khou..Wu Khou",
              ),
              SingleParaTextWidget(text: "Chi, Cuo Yi, Cii Kong Kuei Pan"),
              SizedBox(height: 5.0),
              SingleParaTextWidget(
                text: "Liang Pien Su Li, Cing Thing Ching Than",
              ),
              SizedBox(height: 5.0),
              Text(
                "...(Tien Chuan Se read something)",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 5.0),
              RowItemWidget(
                col1: "Tuei Mien Cuo Yi, Ke Ciu Pai Wei",
                col2: "",
                col3:
                    "Ti Yi Wei, Ti Er Wei, Ti San Wei,Ti Se Wei, Ti Wu Wei, Ti Liu Wei",
              ),
              SingleParaTextWidget(text: "Yi Sia Ke Ciu Pai Wei"),
              RowItemWidget(
                col1: "Cuo Yi,Kuei,",
                col2: "Chu Sien Siang San Cu",
                col3: "Yi Sien, Cai Sien, San Sien",
              ),
              RowItemWidget(
                col1: "",
                col2: "San Khou Sou",
                col3: "Yi Khou,Cai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Cuo Yi,Kuei,",
                col2: "Ya Sien Siang San Cu",
                col3: "Se Sien, Wu Sien, Liuk Sien",
              ),
              RowItemWidget(
                col1: "",
                col2: "San Khou Sou",
                col3: "Se Khou, Wu Khou, Liuk Khou Sou",
              ),
              RowItemWidget(
                col1: "Cuo Yi,Kuei,",
                col2: "Cong Sien Siang San Cu",
                col3: "Chi Sien, Pa Sien, Ciu Sien",
              ),
              RowItemWidget(
                col1: "",
                col2: "San Khou Sou",
                col3: "Chi Khou, Pa Khou, Ciu Khou ",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien, Cai Sien...Wu Sien",
              ),
              RowItemWidget(
                col1: "",
                col2: "Wu Khou Sou",
                col3: "Yi Khou, Cai Khou...Wu Khou Sou",
              ),
              SizedBox(height: 15.0),
              Text(
                "II.Sien Siang Khe Thou",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10.0),
              RowItemWidget(
                col1: "Chi, Cuo Yi,Kuei",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien Cai Sien..Wu Sien",
              ),
              RowItemWidget(
                col1: "Ming Ming Shang Ti",
                col2: "Se Khou Shou",
                col3: "Yi Khou,Cai..Se Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Shen",
                col2: "Ciu Khou Shou",
                col3: "Yi Khou,Cai..Ciu Khou Shou...",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Mi Le Cu Se",
                col2: "Ciu Khou Shou",
                col3: "Yi Khou,Cai..Ciu Khou Shou...",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Nan Hai Ku Fo",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai..Wu Khou Shou...",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Nan Hai Ku Fo",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai..Wu Khou Shou...",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Huo Fo En Se",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai..Wu Khou Shou...",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ye Hui Phu Sha",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai..Wu Khou Shou...",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ke Wei Fa Li Cu",
                col2: "",
                col3: "Yi Khou,Cai..Wu Khou Shou...",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cao Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai,San Khou Shou...",
              ),
              RowItemWidget(
                col1: "Se Cun",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai,San Khou Shou...",
              ),
              RowItemWidget(
                col1: "Se Mu",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai,San Khou Shou...",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cen Tien Yen Shuai",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai,San Khou Shou...",
              ),
              RowItemWidget(
                col1: "Cen Tien Ciang Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai,San Khou Shou...",
              ),
              RowItemWidget(
                col1: "Ciao Hua Phu Sa",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai,San Khou Shou...",
              ),
              RowItemWidget(
                col1: "Ke Wei Ta Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai,San Khou Shou...",
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
                col3: "Yi Sien,Ci Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cin Kong Cu Se",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Thien Ran Ku Fo",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cong Hua Sheng Mu",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cien Pan Yen Cang",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Hu Fa Ta Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Pai Shui Sheng Ti",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ta Te Cen Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Lien Che Phu Sha",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ke Wei Cheng Tao Chien Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              SizedBox(height: 10.0),
              RowItemWidget(
                col1: "Chi, Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ming Ming Shang Ti",
                col2: "Se Khou Shou",
                col3: "Yi Khou,Cai Khou..Se Khou Shou..",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Shen",
                col2: "Wu Khou Shou",
                col3: "Yi Khou Cai Khou..Wu Khou Shou",
              ),
              SizedBox(height: 5.0),
              SingleParaTextWidget(
                text: "Chi, Cuo Yi, Tien Chuan Se Yi Sia Kuei",
              ),
              RowItemWidget(
                col1: "Kei Ke Wei Tien Chuan Se Chan Cia ",
                col2: " Yi Khou Shou",
                col3: "Yi Khou Shou..",
              ),
              SizedBox(height: 10.0),
              SingleParaTextWidget(
                text: "Yi Sia Liang Pien Fen Pan, Tuei Mien Cuo Yi",
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
