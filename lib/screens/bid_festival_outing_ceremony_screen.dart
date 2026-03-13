import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';
import 'package:mct_prayer_book/wigets/single_para_text_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class BidFestivalOutingCeremonyScreen extends StatelessWidget {
  const BidFestivalOutingCeremonyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Bid Festival Outing Ceremony"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "(Kuo Nian Che Sui Li Cie)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Usually Perform 1 day before Chinese New Year before 11 pm",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "I.Offering Prasada Ceremony",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text("Tao Temple : 25 Plate", style: TextStyle()),
              Text("Family Temple : 15 Plate", style: TextStyle()),
              SizedBox(height: 10.0),
              Text(
                "II.Sien Siang Khe Thou",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
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
              SizedBox(height: 10.0),
              RowItemWidget(
                col1: "Chu Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien, San Sien..",
              ),
              RowItemWidget(
                col1: "",
                col2: "San Khou Sou",
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
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien,Cai Sien..Wu Sien..",
              ),
              RowItemWidget(
                col1: "",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai..Wo Khou Shou..",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang Wu Cu",
                col3: "Yi Sien,Cai Sien..Wu Sien..",
              ),
              RowItemWidget(
                col1: "Siang Ming Ming Shang Ti Che Suei ",
                col2: " Se Khou Shou",
                col3: "Yi Khou,Cai..Se Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Siang Cu Thien Shen Shen Che Suei",
                col2: "Ciu Khou Shou",
                col3: "Yi Khou,Cai Khou..Ciu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Siang Mi Le Cu Se Che Suei",
                col2: "Ciu Khou Shou",
                col3: "Yi Khou,Cai Khou..Ciu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Nan Hai Ku Fo",
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
                col1: "Cu Cao Ciin",
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
                col3: "Yi Sien,Cai Sien,San Sien..",
              ),
              RowItemWidget(
                col1: "Cin Kong Cu Se Che Suei ",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien..",
              ),
              RowItemWidget(
                col1: "Thien Ran Ku Fo",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien..",
              ),
              RowItemWidget(
                col1: "Cong Hua Sheng Mu",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Cai Khou..Wu Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien..",
              ),
              RowItemWidget(
                col1: "Pai Shui Sheng Ti",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien..",
              ),
              RowItemWidget(
                col1: "Ta Te Cen Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien..",
              ),
              RowItemWidget(
                col1: "Lien Che Phu Sha",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              RowItemWidget(
                col1: "",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien..",
              ),
              RowItemWidget(
                col1: "Ke Wei Cheng Tao",
                col2: "San Khou Shou",
                col3: "Yi Khou,Cai Khou,San Khou Shou",
              ),
              SingleParaTextWidget(text: "Chi,Cuo Yi,Kuei"),
              RowItemWidget(
                col1: "Kei Ke Wei Tien Chuan Se Che Suei",
                col2: "Yi Khoi Shou",
                col3: "Yi Khou Shou",
              ),
              SingleParaTextWidget(
                text: "Chi, Cuo Yi, Che Suei Li Pi Chuei Shou Cii Kong Thuei",
              ),
              SizedBox(height: 15.0),
              Text(
                "Note:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                child: Text(
                  "After minimum 10 minutes, Clean all the Cup – Bring down 10 Plate of Prasada (2nd and 3rd line) and arrange New 10 Plate of Prasada (Fruits) to be Served during New Year Ceremony – Welcome Kitchen’s God – Maitreya Jayanti.",
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "III.Welcome Kitchen’s God Ceremony (Cie Cao Ciin)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              RowItemWidget(
                col1: "Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Cai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Cie Cao Ciin Kuei Wei",
                col2: "Wu Khou Shou",
                col3: "Yi Khou...Wu Khou Shou",
              ),
              SingleParaTextWidget(
                text:
                    "Chi, Cuo Yi, Cie Cao Ciin Li Pi Chuei Shou Ci Kong Thuei",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
