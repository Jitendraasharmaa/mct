import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../wigets/appBar_widget.dart';
import '../../wigets/sutra_text_widget.dart';

class SinMingSeScreen extends StatelessWidget {
  const SinMingSeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Sin Ming Se - Heart Sutra"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Text(
                    "心命詩",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                    ),
                  ),
                  Text(
                    "Sin Ming Se",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 20),
                  SutraTextWidget(
                    firstRow: "心好命又好",
                    secondRow: "Sin hao ming you hao",
                  ),
                  SutraTextWidget(
                    firstRow: "富貴直到老",
                    secondRow: "Fu kui ce tao lao",
                  ),
                  SutraTextWidget(
                    firstRow: "命好心不好",
                    secondRow: "Ming hao sin pu hao",
                  ),
                  SutraTextWidget(
                    firstRow: "福變為禍兆",
                    secondRow: "Fu pien wei huo cao",
                  ),
                  SutraTextWidget(
                    firstRow: "心好命不好",
                    secondRow: "Sin hao ming pu hao",
                  ),
                  SutraTextWidget(
                    firstRow: "禍轉為福報",
                    secondRow: "Huo cuan wei fu pao",
                  ),
                  SutraTextWidget(
                    firstRow: "心命俱不好",
                    secondRow: "Sin ming cii pu hao",
                  ),
                  SutraTextWidget(
                    firstRow: "遭殃且貧夭",
                    secondRow: "Cao yang chie phin yao",
                  ),
                  SutraTextWidget(
                    firstRow: "心可挽乎命",
                    secondRow: "Sin khe wan hu ming",
                  ),
                  SutraTextWidget(
                    firstRow: "最要存仁道",
                    secondRow: "Cui yao chun ren tao",
                  ),
                  SutraTextWidget(
                    firstRow: "命實造於心",
                    secondRow: "Ming se cao yii sin",
                  ),
                  SutraTextWidget(
                    firstRow: "吉凶惟人召",
                    secondRow: "Ci siong wei ren cao",
                  ),
                  SutraTextWidget(
                    firstRow: "信命不修心",
                    secondRow: "Sin ming pu siu sin",
                  ),
                  SutraTextWidget(
                    firstRow: "陰陽恐虛矯",
                    secondRow: "Yin yang khong sii ciao",
                  ),
                  SutraTextWidget(
                    firstRow: "修心一聽命",
                    secondRow: "Siu sin yi thing ming",
                  ),
                  SutraTextWidget(
                    firstRow: "天地自相保",
                    secondRow: "Thien ti ce siang pao",
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Text(
                    "The Heart And The Destiny",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "With a kind heart and a good destiny",
                        style: GoogleFonts.notoSerifGeorgian(fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "one will enjoy wealth and nobility throughout one's lifetime.",
                        style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 20,
                          color: AppColors.browColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "With a good destiny but an evil heart",
                        style: GoogleFonts.notoSerifGeorgian(fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "one's good fortunes will turn into misfortunes.",
                        style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 20,
                          color: AppColors.browColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "With a kind heart but a bad destiny",
                        style: GoogleFonts.notoSerifGeorgian(fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "one's misfortunes will turn into good fortunes.",
                        style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 20,
                          color: AppColors.browColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "With an evil heart and a bad destiny,",
                        style: GoogleFonts.notoSerifGeorgian(fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "one will suffer from mishaps and poverty.",
                        style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 20,
                          color: AppColors.browColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The heart can improve the destiny,",
                        style: GoogleFonts.notoSerifGeorgian(fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "but only with the cultivation of benevolence.",
                        style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 20,
                          color: AppColors.browColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The destiny is shaped by the heart,",
                        style: GoogleFonts.notoSerifGeorgian(fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "all blessings and mishaps are created by one's own self.",
                        style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 20,
                          color: AppColors.browColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Believing in only the pre-destined without cultivating the heart,",
                        style: GoogleFonts.notoSerifGeorgian(fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "one's possession is, but an illusion.",
                        style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 20,
                          color: AppColors.browColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "By cultivating the heart and accepting God's arrangements,",
                        style: GoogleFonts.notoSerifGeorgian(fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "one will be protected by Heaven and Earth.",
                        style: GoogleFonts.notoSerifGeorgian(
                          fontSize: 20,
                          color: AppColors.browColor,
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
    );
  }
}
