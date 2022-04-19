import 'package:animated_card_input/shared/interfaces/orientation.interface.dart';
import 'package:flutter/material.dart';

OrientationType orientationType = OrientationType();

Widget cardNumberDisplay(ValueNotifier<String> cardNumber) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      ValueListenableBuilder<String>(
        valueListenable: cardNumber,
        builder: (BuildContext context, String cardNumberNew, Widget? first) {
          return SizedBox(
            width: 300,
            child: Text(cardNumberNew, style: const TextStyle(fontSize: 25)),
          );
        }
      )
    ],
  );
}