import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/left_command_text_widget.dart';
import 'package:mct_prayer_book/wigets/right_command_text_widget.dart';

class RowItemWidget extends StatelessWidget {
  final String col1;
  final String col2;
  final String col3;

  const RowItemWidget({
    required this.col1,
    required this.col2,
    required this.col3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: RightCommandTextWidget(text: col1.toString()),
          ),
          Expanded(
            flex: 3,
            child: LeftCommandTextWidget(text: col2.toString()),
          ),
          Expanded(
            flex: 5,
            child: LeftCommandTextWidget(text: col3.toString()),
          ),
        ],
      ),
    );
  }
}
