import 'package:flutter/material.dart';

import '../wigets/appBar_widget.dart';
import '../wigets/info_text_widget.dart';

class SongsScreens extends StatelessWidget {
  const SongsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Sutra"),
      body: InfoTextWidget(text: "There is no holy songs"),
    );
  }
}
