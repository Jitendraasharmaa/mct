import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RightCommandHeadingWidget(text: "Shang Ce-Li"),
                  LeftCommandHeadingWidget(text: "Sia Ce-Li"),
                ],
              ),
              SizedBox(height: 15.0),
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
              Text(
                "Chi, Cuo Yi, Kuei",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
              Text(
                "Chi,Cuo Yi,Kuei",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RowItemWidget(
                col1: "Sien Sian Wu Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien,Se Sien,Wu Sien..",
              ),
              RowItemWidget(
                col1: "Ming Ming Shang Ti",
                col2: "Se Khou Shou",
                col3: "Yi Khou,Chai Khou...Se Khou Sou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Shen",
                col2: "Ciu Khou Shou",
                col3: "Yi Khou,Chai Khou...Ciu Khou Sou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Mi Le Cu Se ",
                col2: "Ciu Khou Shou",
                col3: "Yi Khou,Chai Khou...Ciu Khou Sou",
              ),
              RowItemWidget(
                col1: "Chi,Cuo Yi,Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Nan Hai Ku Fo",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Chai Khou...Wu Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Huo Fo En Se ",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Chai Khou...Wu Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Ye Hui Phu Sha",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Chai Khou...Wu Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Ke Wei Fa Li Cu",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Chai Khou...Wu Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Cao Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Chai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Se Cun",
                col2: "San Khou Shou",
                col3: "Yi Khou,Chai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Se Mu",
                col2: "San Khou Shou",
                col3: "Yi Khou,Chai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Cen Tien Yen Shuai",
                col2: "San Khou Shou",
                col3: "Yi Khou,Chai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Cen Tien Ciang Ciin",
                col2: "San Khou Shou",
                col3: "Yi Khou,Chai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Ciao Hua Phu Sa",
                col2: "San Khou Shou",
                col3: "Yi Khou,Chai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Ke Wei Ta Sien",
                col2: "San Khou Shou",
                col3: "Yi Khou,Chai Khou,San Khou Sou",
              ),
              RowItemWidget(
                col1: "Lao Chien Jen",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Sou..",
              ),
              RowItemWidget(
                col1: "Chien Jen",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Sou..",
              ),
              RowItemWidget(
                col1: "Tien Chuan Se",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Sou..",
              ),
              RowItemWidget(
                col1: "Chien Ren Ta Cong",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Sou..",
              ),
              RowItemWidget(
                col1: "Ce Ci Cu Sien",
                col2: "Yi Khou Shou",
                col3: "Yi Khou Sou..",
              ),
              SizedBox(height: 10),
              Text(
                "Mo Nien Yen Chan Wen   (Please repeat after me)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "(Male) Yi Yin     (Female) Sin Se",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 8),
              Text(
                "Ching Ke Pao Sing Ming (please speak out your name)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              SizedBox(height: 12),
              Text(
                "Chien Sin Kuei Cai, Ming Ming Shang Ti Lien Sia, Sing Shou Cen Chuan",
              ),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Yi Khou, Cai, San Khoi Sou",
              ),
              SizedBox(height: 12),
              Text(
                "Mi Lek Cu Se, Miau Fa Wu Pien, Hu Pi Cong Sheng, Chan Hui Fo Chien Kai Kuo Ce Sin, Thong Cu Thien Phan,",
              ),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Yi Khou, Cai, San Khoi Sou",
              ),
              SizedBox(height: 12),
              Text(
                "Fan Si Fo Thang, Tien Tao Chuo Luan, Wang Chi Cu Se, Se Cuei Rong Kuan",
              ),
              RowItemWidget(
                col1: "Se Khou Sou",
                col2: "",
                col3: "Yi Khou,Cai..Se Khoi Sou",
              ),
              SizedBox(height: 12),
              Text("Na Mo O Mi, Se Fo Thien Yen."),
              RowItemWidget(
                col1: "Se Khou Sou",
                col2: "",
                col3: "Yi Khou,Cai Khou..Se Khoi Sou",
              ),
              RowItemWidget(col1: "Chi, Cuo Yi, Kuei", col2: "", col3: ""),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Cin Kong Cu Se",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Tien Ran Ku Fo",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Cong Hua Sheng Mu",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Pai Shui Sheng Ti",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Ta Te Cen Ciin",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Lien Che Phu Sha",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
              ),
              RowItemWidget(
                col1: "Sien Siang San Cu",
                col2: "",
                col3: "Yi Sien,Chai Sien,San Sien...",
              ),
              RowItemWidget(
                col1: "Ke Wei Cheng Tao Chien Sien",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
              ),
              Text(
                "Chi, Cuo Yi, Kuei",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Mo Chiu..", style: TextStyle(fontWeight: FontWeight.bold)),
              RowItemWidget(
                col1: "Khou Chiu Lao Mu Ta Che Ta Pei",
                col2: "San Pai Khou Sou",
                col3: "Yi, Erl, San, …, Ciu, Yi Pai Khou Shou",
              ),
              RowItemWidget(
                col1: "Chi, Cuo Yi, Kuei",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien,Chai Sien,San Sien",
              ),
              RowItemWidget(
                col1: "Ming Ming Shang Ti",
                col2: "Se Khou Shou",
                col3: "Yi Khou,Chai Khou...Se Khou Shou..",
              ),
              RowItemWidget(
                col1: "Cu Thien Shen Shen",
                col2: "Wu Khou Shou",
                col3: "Yi Khou,Chai Khou...Wu Khou Shou..",
              ),
              Text(
                "Chi, Cuo Yi, (Sien Siang) Khe Thou Li Pi, Chuei Sou Ci Kung, Thuei",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
