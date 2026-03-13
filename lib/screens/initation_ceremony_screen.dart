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
              SizedBox(height: 10),
              SingleParaTextWidget(text: "Sin Chiu Tao Jen Sing Ming Tuei Ma?"),
              SizedBox(height: 10),
              SingleParaTextWidget(text: "Fen Piao"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "This piece of Holy Paper is called as dragon form, once the Dragon Form is being burnt, your name will be Register in the Heaven and Deleted from the Hell, start from now on, you will not be under the control of King Yama, but from today onwards you need to have Good Heart, Speak Good Words, Do Good Deeds to Accumulate Merit and Virtues in order to repay the Kindness of the God and Enlightening Master.",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 5.0),
              RowItemWidget(
                col1: "Yi Thong",
                col2: "Se Khou Shou",
                col3: "Yi Khou...Se Khou",
              ),
              SizedBox(height: 10.0),
              RowItemWidget(
                col1: "Chi, Cuo Yi,Liang Pien Fen Pan",
                col2: "",
                col3:
                    "Ti Yi Wei, Ti Er Wei, Ti San Wei,Ti Se Wei, Ti Wu Wei, Ti Liu Wei.",
              ),
              SingleParaTextWidget(
                text: "Yi Sia Liang Pien Fen Pan, Tuei Mien Cuo Yi",
              ),
              SingleParaTextWidget(
                text: "Ching Than Li Pi, Chuei Sou Ci Kong Thuei",
              ),
              SizedBox(height: 10),
              SingleParaTextWidget(
                text:
                    "Ching Tien Chuan Se Sen Tien Tao Wei, Yin Pao Se Ciu Pai Wei",
              ),
              SizedBox(height: 5.0),
              Text(
                "(Introducer and Guarantor will kneel down in front of God to introduce and make guarantee for the person who want to get the intitiation of Tao.",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5.0),
              RowItemWidget(col1: "Cuo Yi, Kuei", col2: "", col3: ""),
              RowItemWidget(
                col1: "Cong Kuei Jen Tai Piao",
                col2: "Sien Siang San Cu",
                col3: "Yi Sien, Cai Sien, San Sien",
              ),
              RowItemWidget(
                col1: "San Khou Shou",
                col2: "",
                col3: "Yi Khou, Cai Khou, San Khou",
              ),
              SizedBox(height: 5.0),
              SingleParaTextWidget(
                text: "Yin Pao Se Tang Yen Ke Pao Sing Ming",
              ),
              SizedBox(height: 5.0),
              Text(
                "(Introducer and guarantor please speak out your full name)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Ching Ni Men Suei Sia Ce Li Nien"),
                        Text(
                          "(Please repeat after Left Commander)",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Ching Ni Men Suei Wo Nien"),
                        Text(
                          "(Please repeat after me)",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                "Chien Sin Kuei Cai, Ming Ming Shang Ti Lien Sia, Cin Thien, Yen In Yen Pao, Ta Cong Chiu** (xxx Chiu), Fa Yi Ta Tao, Sin Li Cen Chuan, Ru Ruo, In Ju Pao Ju, Cuo Tao Phang Men, Sie Ciao Pai Lien, Hong Phien, Jen Ce Chien Chai Ce, Yen Shou, Thien Ren Khong Cien",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.0),
              RowItemWidget(
                col1: "San Khou Shou",
                col2: "",
                col3: " Yi Khou, Cai Khou, San Khou Shou",
              ),
              SingleParaTextWidget(
                text:
                    "Chi, Cuo Yi, Yin Pao Se Tang Yen Li Pi Chuei Sou Ci Kong, Thuei",
              ),
              SingleParaTextWidget(
                text: "Ching Sin Chiu Tao Jen Ke Ciu Pai Wei",
              ),
              SizedBox(height: 10.0),
              SingleParaTextWidget(
                text: "Ching Tien Chuan Se Che Pei Ci Ci Hua",
              ),
              SizedBox(height: 5.0),
              Text(
                "……… (Tien Chuan Se will say something to the person who will received Tao)",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.0),
              SingleParaTextWidget(
                text: "Cuo Yi, Kuei, Cong Kuei Jen Tai Piao",
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    RowItemWidget(
                      col1: "Sien Siang San Cu",
                      col2: "",
                      col3: "Yi Sien, Cai Sien, San Sien",
                    ),
                    RowItemWidget(
                      col1: "San Khou Shou",
                      col2: "",
                      col3: "Yi Khou, Cai Khou, San Khou Shou",
                    ),
                  ],
                ),
              ),
              SingleParaTextWidget(
                text: "Ching Tien Chuan Se Chuan Ku He Thong",
              ),
              RowItemWidget(
                col1: "San Khou Shou",
                col2: "",
                col3: "Yi Khou, Cai Khou, San Khou Shou",
              ),
              SizedBox(height: 10),
              SingleParaTextWidget(
                text: "Phing Sin Cing Chi, Yen Khan Fo Teng Kuei Thing Li Cu",
              ),
              Text(
                "………(Tien Chuan Se read something)",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RowItemWidget(
                col1: "San Khou Shou",
                col2: "",
                col3: "Yi Khou, Cai Khou, San Khou Shou",
              ),
              Text(
                "(twice for Gents & once for Ladies)",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sin Chiu Tao Jen Tang Yen Ke Pao Sing Ming"),
                  Text(
                    "(Please Speak Out Your Full Name)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Ching Ni Men Suei Sia Ce Li Nien"),
                        Text(
                          "(Please repeat after Left Commander)",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Ching Ni Men Suei Wo Nien"),
                        Text(
                          "(Please repeat after me)",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                "Chien Sin Kuei Cai, Ming Ming Shang Ti Lien Sia, Cin Thien Yen Chiu, Fa Yi Ta Tao, Sin Li Cen Chuan, Chiu Tao Yi Hou, Chen Sin Pao Sou, (for Gents) Se Sin Chan Hui, (for Ladies) Se Sin Siu Lien, Ju You, Si Sin Cia Yi, Thuei Suo Pu Chien, Chi Se Mie Cu, Miao Se Chien Jen, Pu Cun Fo Kuei, Sie Lou Thien Ci, Ni Tao Pu Sien, (Gents) Pu Liang Li Er Wei Ce, (Ladies) Pu Chen Sin Siu Lien Ce, Yen Shou, Thien Ren Khong Cien.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.0),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Yi Khou, Cai Khou, San Khou Shou",
              ),
              Text(
                "…..… (Tien Chuan Se read something)",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Yi Khou, Cai Khou, San Khou Shou",
              ),
              SingleParaTextWidget(
                text: "Phing Sin Cing Chi Yen Khan Fo Teng, Cing Tai Tien Sien",
              ),
              Text(
                "…..… (Tien Chuan Se read something)",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Yi Khou, Cai Khou, San Khou Shou",
              ),
              SizedBox(height: 10.0),
              SingleParaTextWidget(
                text: "Ching Tien Chuan Se Chuan Chuan Khou Cie",
              ),
              Text(
                "(...Tien Chuan Se will read something)",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RowItemWidget(
                col1: "San Khou Sou",
                col2: "",
                col3: "Yi Khou, Cai Khou, San Khou Shou",
              ),
              SizedBox(height: 15),
              RowItemWidget(
                col1: "Sie Sie Lao Mu Khai Tao Ce En",
                col2: "San Khou Sou",
                col3: "Yi Khou,San Khou Shou",
              ),
              SizedBox(height: 5.0),
              RowItemWidget(
                col1: "Cu Thien Sen Sen",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Mi Lek Cu Se",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Nan Hai Ku Fo",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Huo Fo En Se",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Ye Hui Phu Sa",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Se Cun",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Se Mu",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Tien Chuan Se",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Ing Pao Se",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              RowItemWidget(
                col1: "Chien Ren Ta Cong",
                col2: "Yi Khou Sou",
                col3: "Yi Khou Sou",
              ),
              SingleParaTextWidget(
                text: "Chi, Cuo Yi, Chiu Tao Li Pi Chuei Shou Ci Kong, Thuei",
              ),
              SizedBox(height: 15.0),
              Text(
                "V.Ceremony to Deliver Holy Beings ( Song Cia Li Cie )",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "This Ceremony usually will do it after Explanation of 3 Treasures.",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),
              RowItemWidget(col1: "Cuo Yi, Kuei", col2: "", col3: ""),
              RowItemWidget(
                col1: "Ming Ming Sang Ti",
                col2: "Se Khou Sou",
                col3: "Yi Khou...Se Khou",
              ),
              RowItemWidget(
                col1: "Cu Thien Sen Sen",
                col2: "Wu Khou Sou",
                col3: "Yi Khou,Chai...Wu Khou",
              ),
              SingleParaTextWidget(
                text: "Chi, Cuo Yi, Song Cia Li Pi Chuei Shou Ci Kong Thuei",
              ),
              SizedBox(height: 20),
              Text(
                "Note:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Cing: "),
                      Text(
                        " if Initiation people Different Gender with Swamiji",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text("Kuei: "),
                      Text(
                        " if Initiation people Same Gender with Swamiji",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "**Ta Cong Chiu  : if initiation people more than 2 people**",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
