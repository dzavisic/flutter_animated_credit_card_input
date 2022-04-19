import 'package:animated_card_input/shared/interfaces/orientation.interface.dart';
import 'package:animated_card_input/shared/widgets/spacing.widget.dart';
import 'package:flutter/material.dart';

OrientationType orientationType = OrientationType();

Widget cardholderNameValidThruInput(
  TextEditingController cardholderNameController,
  ValueNotifier<String> cardholderName,
  TextEditingController validThruController,
  ValueNotifier<String> validThru
) {
  return Column(
    children: [
      /// CARDHOLDER NAME INPUT FIELD
      cardholderNameInput(cardholderNameController, cardholderName),
      sSpacing(orientationType.Vertical),
      /// VALID THRU INPUT FIELD
      validThruInput(validThruController, validThru)
    ],
  );
}

Widget cardholderNameInput(
  TextEditingController cardholderNameController,
  ValueNotifier<String> cardholderName
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: TextFormField(
      cursorColor: const Color.fromRGBO(32,206,202, 1),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
        ),
        labelText: 'Name',
        hintText: 'John Doe',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            cardholderNameController.clear();
            cardholderName.value = 'John Doe';
          },
          icon: const Icon(Icons.clear, color: Colors.grey),
        ),
      ),
      controller: cardholderNameController,
      onChanged: (value) {
        cardholderName.value = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your name.';
        }
      },
    ),
  );
}

Widget validThruInput(
    TextEditingController validThruController,
    ValueNotifier<String> validThru
    ) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: TextFormField(
      cursorColor: const Color.fromRGBO(32,206,202, 1),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
        ),
        labelText: 'Valid Thru',
        hintText: 'MM/YY',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        counterText: '',
        suffixIcon: IconButton(
          onPressed: () {
            validThruController.clear();
            validThru.value = '';
          },
          icon: const Icon(Icons.clear, color: Colors.grey),
        ),
      ),
      controller: validThruController,
      keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
      onChanged: (value) {
        value = value.replaceAll(RegExp(r"\D"), "");
        switch (value.length) {
          case 0:
            validThruController.text = "MM/YY";
            validThruController.selection = const TextSelection.collapsed(offset: 0);
            validThru.value = validThruController.text;
            break;
          case 1:
            validThruController.text = "${value}M/YY";
            validThruController.selection = const TextSelection.collapsed(offset: 1);
            validThru.value = validThruController.text;
            break;
          case 2:
            validThruController.text = "$value/YY";
            validThruController.selection = const TextSelection.collapsed(offset: 2);
            validThru.value = validThruController.text;
            break;
          case 3:
            validThruController.text = "${value.substring(0, 2)}/${value.substring(2)}Y";
            validThruController.selection = const TextSelection.collapsed(offset: 4);
            validThru.value = validThruController.text;
            break;
          case 4:
            validThruController.text = "${value.substring(0, 2)}/${value.substring(2, 4)}";
            validThruController.selection = const TextSelection.collapsed(offset: 5);
            validThru.value = validThruController.text;
            break;
        }
        if (value.length > 4) {
          validThruController.text = "${value.substring(0, 2)}/${value.substring(2, 4)}";
          validThruController.selection = const TextSelection.collapsed(offset: 5);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your name.';
        }
      },
    ),
  );
}