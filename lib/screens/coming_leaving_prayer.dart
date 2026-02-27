import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/left_command_heading_widget.dart';
import 'package:mct_prayer_book/wigets/right_command_heading_widget.dart';
import 'package:mct_prayer_book/wigets/right_command_text_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';

class ComingLeavingPrayer extends StatelessWidget {
  const ComingLeavingPrayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Coming/Leaving Prayer"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            children: [
              // ---------------- Main table block ----------------
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
                  children: const [
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
                      col1: "Ming Ming Shang Ti",
                      col2: "Wu Khou Sou",
                      col3: "Yi Khou..Wu Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Cu Thien Shen Sheng",
                      col2: "San Khou Sou",
                      col3: "Yi Khou..San Khou Shou",
                    ),
                    RowItemWidget(
                      col1: "Mi Lek Cu Se,",
                      col2: "San Khou Sou",
                      col3: "Yi Khou..San Khou Shou",
                    ),
                    RowItemWidget(
                      col1: "Nan Hai Ku Fo,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Huo Fo En Se,",
                      col2: "Yi Khou Sou",
                      col3: "Yi Khou Sou",
                    ),
                    RowItemWidget(
                      col1: "Ye Hui Phu Sa,",
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
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ---------------- Extra information section ----------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title("If Tien Chuan Se (Master) is Present"),

                  _infoBlock(
                    "You need to stand and kneel one more time to make a bow for Master.\n\n"
                    "Chi, Cuo Yi, (Tien Chuan Se Yi Sia) Kuei\n"
                    "Kei Tien Chuan Se (Chan Cia) (Che Cia)   Yi Khou Sou\n\n"
                    "Chi, Cuo Yi, (Chan Cia) (Che Cia)\n"
                    "Li Pi, Chuei Shou, Ci Kong, Thuei",
                  ),

                  const SizedBox(height: 24),

                  _title("Thing to know"),

                  _infoBlock(
                    "Chien Jen Ta Cong : All Tao Members who are present.\n\n"
                    "Because the prayer is bowing to us, we also humbly bow back.",
                  ),

                  const SizedBox(height: 24),

                  _title("Meaning of Chinese Terms"),

                  _twoCol("Cuo Yi", "Bow"),
                  _twoCol("Kui", "Kneel"),
                  _twoCol("Chi", "Stand"),
                  _twoCol("Chui Shou", "Hands Down"),
                  _twoCol("Ci Kong", "Bow"),
                  _twoCol("Thui", "Move Behind"),

                  const SizedBox(height: 24),

                  _title("Coming / Going Commands"),

                  _twoCol("If you're coming, say", "Chan Cia"),
                  _twoCol("If you're going, say", "Che Cia"),
                  _twoCol("If Tien Chuan Se going, say", "Song Cia"),
                  _twoCol("If Tien Chuan Se coming, say", "Cie Cia"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------

Widget _title(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      text,
      style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w600),
    ),
  );
}

Widget _infoBlock(String text) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Text(text, style: const TextStyle(height: 1.45, fontSize: 14.5)),
  );
}

Widget _twoCol(String left, String right) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Expanded(child: Text(left, style: const TextStyle(fontSize: 14.5))),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Text(
            right,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    ),
  );
}
