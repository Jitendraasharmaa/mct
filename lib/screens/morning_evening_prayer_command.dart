import 'package:flutter/material.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/left_command_heading_widget.dart';
import 'package:mct_prayer_book/wigets/right_command_heading_widget.dart';
import 'package:mct_prayer_book/wigets/right_command_text_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';

class MorningEveningPrayerCommand extends StatelessWidget {
  const MorningEveningPrayerCommand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Morning-Evening Prayer"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Top headings
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RightCommandHeadingWidget(text: "Shang Ce-Li"),
                        LeftCommandHeadingWidget(text: "Sia Ce-Li"),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Sub heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [RightCommandTextWidget(text: "Cuo Yi, Kuei")],
                    ),
                    SizedBox(height: 10),
                    RowItemWidget(
                      col1: "Sien Siang Wu Cu",
                      col2: "",
                      col3: "Yi Sien,Cai Sien..Wu Sien",
                    ),
                    RowItemWidget(
                      col1: "Sien Siang San Cu",
                      col2: "",
                      col3: "Yi Sien,Cai Sien, San Sien",
                    ),
                    RowItemWidget(
                      col1: "Sien Siang San Cu",
                      col2: "",
                      col3: "Yi Sien,Cai Sien, San Sien",
                    ),
                    RowItemWidget(
                      col1: "Sien Siang San Cu",
                      col2: "",
                      col3: "Yi Sien,Cai Sien, San Sien",
                    ),
                    RowItemWidget(
                      col1: "Sien Siang Yi Cu",
                      col2: "",
                      col3: "Yi Sien",
                    ),

                    RowItemWidget(
                      col1: "Ming Ming Shang Ti,",
                      col2: "Se Khou Sou",
                      col3: "Yi Khou,Cai Khou..Se Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Cu Thien Shen Sheng",
                      col2: "Wu Khou Sou",
                      col3: "Yi Khou,Cai Khou..Wu Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Mi Lek Cu Se,",
                      col2: "Wu Khou Sou",
                      col3: "Yi Khou,Cai Khou..Wu Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Nan Hai Ku Fo,",
                      col2: "San Khou Sou",
                      col3: "Yi Khou,Cai Khou,San Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Huo Fo En Se,",
                      col2: "San Khou Sou",
                      col3: "Yi Khou,Cai Khou,San Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Ye Hui Phu Sa,",
                      col2: "San Khou Sou",
                      col3: "Yi Khou,Cai Khou,San Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Ke Wei Fa Li Cu,",
                      col2: "San Khou Sou",
                      col3: "Yi Khou,Cai Khou,San Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Cao Ciin,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Se Cun,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Se Mu,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Ceng Tien Yen Shuai,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Ceng Tien Ciang Ciin,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Ciau Hua Phu Sa,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Ke Wei Ta Sien,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Lao Chien Ren,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Chien Ren,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Tien Chuan Se,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Yin Pau Se,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Chien Jen Ta Cong,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Ce Ci Cu Sien,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mo Nien Yen Chan Wen   (Please repeat after me)",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "(Male) Yi Yin     (Female) Sin Se,  Ching Ke Pao Sing Ming (please speak out your name)",
                          style: TextStyle(fontSize: 13),
                        ),

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
                        SizedBox(height: 20),
                        RowItemWidget(
                          col1: "Cin Kong Cu Se",
                          col2: "Wu Khou Sou",
                          col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
                        ),
                        SizedBox(height: 5.0),
                        RowItemWidget(
                          col1: "Tien Ran Ku Fo",
                          col2: "Wu Khou Sou",
                          col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
                        ),
                        SizedBox(height: 5.0),
                        RowItemWidget(
                          col1: "Cong Hua Sheng Mu",
                          col2: "Wu Khou Sou",
                          col3: "Yi Khou,Cai Khoi..Wo Khou Sou",
                        ),
                        RowItemWidget(
                          col1: "Pai Shui Sheng Ti",
                          col2: "San Khou Sou",
                          col3: "Yi Khou,Cai Khoi,San Khou Sou",
                        ),
                        RowItemWidget(
                          col1: "Ta Te Cen Ciin",
                          col2: "San Khou Sou",
                          col3: "Yi Khou,Cai Khoi,San Khou Sou",
                        ),
                        RowItemWidget(
                          col1: "Lien Che Phu Sha",
                          col2: "San Khou Sou",
                          col3: "Yi Khou,Cai Khoi,San Khou Sou",
                        ),
                        RowItemWidget(
                          col1: "Ke Wei Cheng Tao Chien Sien",
                          col2: "San Khou Sou",
                          col3: "Yi Khou,Cai Khoi,San Khou Sou",
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Mo Chiu (Do a prayer inside your heart)",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Khou Chiu Lao Mu Ta Che Ta Pei"),
                        RowItemWidget(
                          col1: "Yi Pai Khou Sou",
                          col2: "",
                          col3: "Yi, Erl, San, …, Ciu, Yi Pai Khou Shou",
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Chi, Cuo Yi, (Sien Siang) Khe Thou Li Pi, Chuei Sou Ci Kung, Thuei",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        Container(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Chien Sin Kwei Cai, Ming Ming Sang Ti Lien Sia, Sin Sou Cen Chuan.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "As I kneel with all my heart before the lotus seat of the Brightly Illuminating Lord of the Most High, so fortunate to receive the real transmission.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, height: 1.6),
                              ),

                              SizedBox(height: 24),

                              /// SECTION 2
                              Text(
                                "Mi Lek Cu Se, Miao Fa Wu Pien, Hu Pi Cong Sen, Chan Huei Fo Chien, Kai Kuo Ce Sin, Thong Cu Thien Phan.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Our Grand Master, Buddha Maitreya, his dharma is boundless to protect all beings. Now I repent in front of Buddha, to transform and renew myself, together be part of the Heavenly state.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, height: 1.6),
                              ),

                              SizedBox(height: 24),

                              /// SECTION 3
                              Text(
                                "Fan Si Fo Thang, Tien Tao Chuo Luan, Wang Chi Cu Se, Se Cuei Rong Khuan.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Concerning all the matters around Fo Thang that we did not do properly, beg and hope Grand Master will give forgiveness.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, height: 1.6),
                              ),

                              SizedBox(height: 16),
                              Text(
                                "Na Mo O Mi Se Fo Thien Yen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "(Nm) (Name of Maitreya Buddha)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.blackColor,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
