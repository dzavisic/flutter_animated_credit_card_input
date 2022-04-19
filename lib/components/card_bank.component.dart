import 'package:animated_card_input/shared/widgets/spacing.widget.dart';
import 'package:flutter/material.dart';

Widget bank(String bankName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      mSpacing(orientationType.Horizontal),
      Text(bankName, style: const TextStyle(fontSize: 30))
      /// IF WE WANT TO USE LOGO
      // SizedBox(
      //   width: 100,
      //   child: Image.asset('assets/..png'),
      // ),
    ],
  );
}