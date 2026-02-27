import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/row_items_widget.dart';

import '../wigets/left_command_heading_widget.dart';
import '../wigets/right_command_heading_widget.dart';

class ServingPrasadaScren extends StatelessWidget {
  const ServingPrasadaScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Serving Prasada/Sien Kong Li Cie"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RightCommandHeadingWidget(text: "Shang Ce-Li"),
                      LeftCommandHeadingWidget(text: "Sia Ce-Li"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Ching Sien Cie Yen Siang Jen Sien Siang Ciu Pai Wei",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.0),
                    RowItemWidget(
                      col1: "Cuo Yi, Kuei",
                      col2: "Sien Siang San Cu",
                      col3: "Yi Sien, Cai Sien, San Sien",
                    ),
                    RowItemWidget(
                      col1: "San Khou Shou",
                      col2: "",
                      col3: "Yi khou, Chai Khou, San Khou Sou",
                    ),
                    Text("Chi, Cuo Yi, Chuei Shou Ci Kong Thuei"),
                    SizedBox(height: 5.0),
                    Text(
                      "Sien Kong Li Khai Se, Liang Pien Phai Pan\nTuei Mien Cuo Yi, Ke Ciu Pai Wei",
                    ),
                    SizedBox(height: 10.0),
                    RowItemWidget(
                      col1: "Cuo Yi, Kuei",
                      col2: "San Khou Shou",
                      col3: "Yi Khou,Chai Khou,San Khou",
                    ),
                    SizedBox(height: 10.0),
                    Text("Chi, Cuo Yi, Chien Cin Ciu Sien Wei"),
                    RowItemWidget(
                      col1: "Cuo Yi,",
                      col2: "San Khou Shou",
                      col3: "Yi Khou,Chai Khou,San Khou",
                    ),
                    SizedBox(height: 10.0),
                    RowItemWidget(
                      col1: "Tuan, Kuei,Ci Mei Chi,Cie, Cii Mei Chi",
                      col2: "",
                      col3: "Cuo Yi",
                    ),
                    RowItemWidget(
                      col1: "Cie, Cii Mei Chi",
                      col2: "",
                      col3: "Yi Khou Shou",
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Chen Cing Fong Sien",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(" Shang Ching Sia Cuo"),
                    Text(" Shang Shou Cii Cong"),
                    Text(" Sia Shou Cii Cong"),
                    SizedBox(height: 5.0),
                    RowItemWidget(
                      col1: "Cuo Yi,",
                      col2: "Yi Khou Shou",
                      col3: "",
                    ),
                    SizedBox(height: 5.0),
                    Text("Ching Tuan Kong Jen Ciu Pai Wei"),
                    RowItemWidget(
                      col1: "Cuo Yi,",
                      col2: "San Khou Shou",
                      col3: "Yi Khou, Chai Khou, San khou Sou",
                    ),
                    RowItemWidget(col1: "Chi,", col2: "", col3: ""),
                    Text("Thong Cuo Yi,Hou Thuei Kuei Pai Wei,"),
                    RowItemWidget(
                      col1: "Cuo Yi, Kuei,",
                      col2: "San Khou Shou,",
                      col3: "Yi Khou, Chai khou, San khou sou",
                    ),
                    SizedBox(height: 5.0),
                    Text("Chi, Cuo Yi, Liang Pien Fen Pan,"),
                    Text("Tuei Mien Cuo Yi"),
                    Text("Sien Kong Li Pi Chuei Shou Ci Kong Thuei"),

                    SizedBox(height: 15.0),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// NOTE TITLE
                          const Text(
                            "Note :",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          /// ROW 1
                          noteRow(
                            title: "Shan Ching Sia Cuo",
                            description: "for cup number 1 & 2",
                          ),

                          const SizedBox(height: 8),

                          /// ROW 2
                          noteRow(
                            title: "Shang Shou Cii Cong",
                            description:
                                "if Right Commander side put the Prasada in the Middle",
                          ),

                          const SizedBox(height: 8),

                          /// ROW 3
                          noteRow(
                            title: "Sia Shou Cii Cong",
                            description:
                                "if Left Commander side put the Prasada in the Middle",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget noteRow({required String title, required String description}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// LEFT TEXT
      Expanded(
        flex: 4,
        child: Text(
          "$title : ",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      /// RIGHT TEXT
      Expanded(
        flex: 4,
        child: Text(description, style: const TextStyle(fontSize: 14)),
      ),
    ],
  );
}
