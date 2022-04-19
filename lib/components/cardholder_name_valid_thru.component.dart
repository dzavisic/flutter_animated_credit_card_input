import 'package:animated_card_input/shared/interfaces/orientation.interface.dart';
import 'package:animated_card_input/shared/widgets/spacing.widget.dart';
import 'package:flutter/material.dart';

OrientationType orientationType = OrientationType();

Widget cardholderNameValidThru(ValueNotifier<String> cardholderName, ValueNotifier<String> validThru) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text('CARDHOLDER NAME', style: TextStyle(fontSize: 12)),
          Text('VALID THRU', style: TextStyle(fontSize: 12))
        ],
      ),
      xsSpacing(orientationType.Vertical),
      Row(
        children: [
          mlSpacing(orientationType.Horizontal),
          SizedBox(
            width: 230,
            child: cardholderNameDisplay(cardholderName),
          ),
          xsSpacing(orientationType.Horizontal),
          SizedBox(
            width: 70,
            child: validThruDisplay(validThru)
          )
        ],
      )
    ],
  );
}

Widget cardholderNameDisplay(ValueNotifier<String> cardholderName) {
  return ValueListenableBuilder<String>(
      valueListenable: cardholderName,
      builder: (BuildContext context, String cardholderName, Widget? cardholderNameWidget) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(cardholderName, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18))
            ),
          ],
        );
      }
  );
}

Widget validThruDisplay(ValueNotifier<String> validThru) {
  return ValueListenableBuilder<String>(
      valueListenable: validThru,
      builder: (BuildContext context, String cardholderName, Widget? cardholderNameWidget) {
        return Text(cardholderName, style: const TextStyle(fontSize: 18));
      }
  );
}