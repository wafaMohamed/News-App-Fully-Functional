import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomDropdownButton extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String) onChanged;

  const CustomDropdownButton({
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: CustomText(text: item),
        );
      }).toList(),
      onChanged: (String? value) {
        onChanged(value!);
      },
    );
  }
}
