import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/info_text_widget.dart';

class HolyMessageScreen extends StatelessWidget {
  const HolyMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Holy Messages"),
      body: InfoTextWidget(text: "There is no holy message"),
    );
  }
}
