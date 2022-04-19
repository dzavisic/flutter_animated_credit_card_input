import 'package:animated_card_input/components/form_cardholder_name_valid_thru_input.component.dart';
import 'package:animated_card_input/components/form_card_input.component.dart';
import 'package:animated_card_input/components/form_ccv_number_input.component.dart';
import 'package:animated_card_input/shared/interfaces/orientation.interface.dart';
import 'package:animated_card_input/shared/widgets/spacing.widget.dart';
import 'package:flutter/material.dart';

OrientationType orientationType = OrientationType();

Widget form(
    TextEditingController cardNumberController,
    ValueNotifier<String> cardNumber,
    TextEditingController cardholderNameController,
    ValueNotifier<String> cardholderName,
    TextEditingController validThruController,
    ValueNotifier<String> validThru,
    TextEditingController ccvController,
    ValueNotifier<String> ccv,
    _flip
    ) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Card(
      elevation: 3,
      child: Column(
        children: [
          mSpacing(orientationType.Vertical),
          cardTitle(_flip),
          sSpacing(orientationType.Vertical),
          Column(
            children: [
              /// CARD NUMBER INPUT FIELD
              cardNumberInput(cardNumberController, cardNumber),
              xsSpacing(orientationType.Vertical),
              /// CARDHOLDER NAME AND VALID THRU INPUT FIELDS
              cardholderNameValidThruInput(cardholderNameController, cardholderName, validThruController, validThru),
              xsSpacing(orientationType.Vertical),
              /// CCV NUMBER
              ccvNumberInput(ccvController, ccv, _flip)
            ],
          ),
          mSpacing(orientationType.Vertical)
        ],
      ),
    ),
  );
}

Widget cardTitle(_flip) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text('Card Information', style: TextStyle(fontSize: 20)),
      xsSpacing(orientationType.Horizontal),
      GestureDetector(
        onTap: _flip,
        child: const Text('Flip card', style: TextStyle(fontSize: 15, color: Color.fromRGBO(32,206,202, 1))),
      )
    ],
  );
}