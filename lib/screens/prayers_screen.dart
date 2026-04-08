import 'package:flutter/material.dart';

import '../wigets/appBar_widget.dart';
import '../wigets/info_text_widget.dart';

class PrayersScreen extends StatelessWidget {
  const PrayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Prayers"),
      body: InfoTextWidget(text: "There is no prayer details"),
    );
  }
}
