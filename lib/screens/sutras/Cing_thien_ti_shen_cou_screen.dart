import 'package:flutter/material.dart';

import '../../wigets/appBar_widget.dart';
import '../../wigets/sutra_text_widget.dart';

class CingThienTiShenCouScreen extends StatelessWidget {
  const CingThienTiShenCouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppbarWidget(title: "Cing Thien Ti Shen Cou"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: theme.dividerColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.18 : 0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                "淨天地神咒",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),
              Text(
                "Cing Thien Ti Shen Cou",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 20),
              SutraTextWidget(firstRow: "天地自然", secondRow: "Thien ti ce ran"),
              SutraTextWidget(firstRow: "穢氣消散", secondRow: "Hui chi siao san"),
              SutraTextWidget(
                firstRow: "洞中玄虛",
                secondRow: "Tong cong siien sii",
              ),
              SutraTextWidget(
                firstRow: "恍朗太玄",
                secondRow: "Huang lang thai siien",
              ),
              SutraTextWidget(firstRow: "八方威神", secondRow: "Pa fang wei shen"),
              SutraTextWidget(firstRow: "使我自然", secondRow: "Se wo ce ran"),
              SutraTextWidget(firstRow: "靈寶符命", secondRow: "Ling pao fu ming"),
              SutraTextWidget(firstRow: "普告九天", secondRow: "Phu kao ciu thien"),
              SutraTextWidget(firstRow: "乾囉怛那", secondRow: "Chien luo ta na"),
              SutraTextWidget(
                firstRow: "洞剛太玄",
                secondRow: "Tong kang thai siien",
              ),
              SutraTextWidget(firstRow: "斬妖縛邪", secondRow: "Can yao fu sie"),
              SutraTextWidget(firstRow: "殺鬼萬千", secondRow: "Sa kui wan chien"),
              SutraTextWidget(
                firstRow: "中山神咒",
                secondRow: "Cong shan shen cou",
              ),
              SutraTextWidget(firstRow: "原始御文", secondRow: "Yuen se yii wen"),
              SutraTextWidget(firstRow: "持誦一遍", secondRow: "Che song yi pien"),
              SutraTextWidget(firstRow: "卻鬼延年", secondRow: "Chie kui yen nien"),
              SutraTextWidget(firstRow: "按行五嶽", secondRow: "An sing wu yue"),
              SutraTextWidget(firstRow: "八海知聞", secondRow: "Pa hai ce wen"),
              SutraTextWidget(firstRow: "魔王束手", secondRow: "Mo wang shu shou"),
              SutraTextWidget(firstRow: "侍衛我軒", secondRow: "Se wei wo siien"),
              SutraTextWidget(
                firstRow: "凶穢消散",
                secondRow: "siong hui siao san",
              ),
              SutraTextWidget(
                firstRow: "道氣常存",
                secondRow: "Tao chi chang chun",
              ),
              SutraTextWidget(
                firstRow: "急急如律令",
                secondRow: "Ci ci ru lii ling",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
