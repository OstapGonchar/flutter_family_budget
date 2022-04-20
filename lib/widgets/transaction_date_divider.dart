import 'package:flutter/material.dart';

Row buildDivider(String dateText) {
  return Row(
    children: [
      Container(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            dateText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
      const Expanded(
          child: Divider(
        height: 32.0,
        indent: 16,
        thickness: 16,
        color: Colors.blueAccent,
      ))
    ],
  );
}
