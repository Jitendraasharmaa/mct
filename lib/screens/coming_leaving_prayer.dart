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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const AppbarWidget(title: "Coming/Leaving Prayer"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            children: [
              // ---------------- Main table block ----------------
              Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: theme.dividerColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDark ? 0.20 : 0.10),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: const Column(
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
                  _title(context, "If Tien Chuan Se (Master) is Present"),

                  _infoBlock(
                    context,
                    "You need to stand and kneel one more time to make a bow for Master.\n\n"
                    "Chi, Cuo Yi, (Tien Chuan Se Yi Sia), "
                    "(Ke Wei) Tien Chuan Se (Chan Cia) (Che Cia)   Yi Khou Sou\n\n"
                    "Chi, Cuo Yi, (Chan Cia) (Che Cia)\n"
                    "Li Pi, Chuei Shou, Ci Kong, Thuei",
                  ),

                  const SizedBox(height: 24),

                  _title(context, "Thing to know"),

                  _infoBlock(
                    context,
                    "Chien Jen Ta Cong : All Tao Members who are present.\n\n"
                    "Because the prayer is bowing to us, we also humbly bow back.",
                  ),

                  const SizedBox(height: 24),

                  _title(context, "Meaning of Chinese Terms"),

                  _twoCol(context, "Cuo Yi", "Bow"),
                  _twoCol(context, "Kui", "Kneel"),
                  _twoCol(context, "Chi", "Stand"),
                  _twoCol(context, "Chui Shou", "Hands Down"),
                  _twoCol(context, "Ci Kong", "Bow"),
                  _twoCol(context, "Thui", "Move Behind"),

                  const SizedBox(height: 24),

                  _title(context, "Coming / Leaving Commands"),

                  _twoCol(context, "If you're leaving, say", "Che Cia"),
                  _twoCol(
                    context,
                    "If you are in Temple and TCS arrived:",
                    "Cie Cia → Song Cia",
                  ),
                  _twoCol(
                    context,
                    "TCS leaving but you are staying back",
                    "Song Cia",
                  ),
                  _twoCol(context, "If you're coming, say", "Chan Cia"),
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

Widget _title(BuildContext context, String text) {
  final theme = Theme.of(context);

  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16.5,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.onSurface,
      ),
    ),
  );
}

Widget _infoBlock(BuildContext context, String text) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: isDark ? theme.cardColor : Colors.grey.shade100,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: theme.dividerColor),
    ),
    child: Text(
      text,
      style: TextStyle(
        height: 1.45,
        fontSize: 14.5,
        color: theme.colorScheme.onSurface,
      ),
    ),
  );
}

Widget _twoCol(BuildContext context, String left, String right) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Expanded(
          child: Text(
            left,
            style: TextStyle(
              fontSize: 14.5,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: isDark
                ? theme.colorScheme.primary.withOpacity(0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.dividerColor),
          ),
          child: Text(
            right,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    ),
  );
}
