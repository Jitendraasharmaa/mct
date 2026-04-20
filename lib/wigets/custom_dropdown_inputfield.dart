import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/card_shadow_widget.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final T? value;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownFormField({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardShadowWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<T>(
            value: value,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
            ),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()),
              );
            }).toList(),
            onChanged: onChanged,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
