import 'package:animated_card_input/components/card_bank.component.dart';
import 'package:animated_card_input/components/card_chip_image.component.dart';
import 'package:animated_card_input/components/card_number.component.dart';
import 'package:animated_card_input/components/cardholder_name_valid_thru.component.dart';
import 'package:animated_card_input/shared/interfaces/orientation.interface.dart';
import 'package:animated_card_input/shared/widgets/spacing.widget.dart';
import 'package:flutter/material.dart';

OrientationType orientationType = OrientationType();

Widget cardFront(
    BuildContext context,
    ValueNotifier<String> cardNumber,
    ValueNotifier<String> cardholderName,
    ValueNotifier<String> validThru,
    String bankName
    ) {
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    height: 240,
    decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(26, 168, 166, 1.0),
            Color.fromRGBO(70, 227, 223, 1.0),
          ],
        ),
        borderRadius: BorderRadius.circular(12)
    ),
    child: Column(
      children: [
        sSpacing(orientationType.Vertical),
        /// BANK NAME WIDGET
        bank(bankName),
        sSpacing(orientationType.Vertical),
        /// CHIP IMAGE WIDGET
        chipImg(),
        sSpacing(orientationType.Vertical),
        /// CARD NUMBER WIDGET
        cardNumberDisplay(cardNumber),
        sSpacing(orientationType.Vertical),
        /// CARDHOLDER NAME AND VALID THRU
        cardholderNameValidThru(cardholderName, validThru)
      ],
    ),
  );
}
