import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.label,
      required this.function,
      required this.icon})
      : super(key: key);
  final String label;
  final Function function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: CustomText(
        text: label,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onTap: () {
        function();
      },
    );
  }
}
