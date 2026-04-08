import 'package:flutter/material.dart';

import '../wigets/appBar_widget.dart';
import '../wigets/info_text_widget.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Events"),
      body: InfoTextWidget(text: "There is no events"),
    );
  }
}
