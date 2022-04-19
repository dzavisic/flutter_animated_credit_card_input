import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget cardNumberInput(TextEditingController cardNumberController, ValueNotifier<String> cardNumber) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: TextFormField(
      keyboardType: TextInputType.number,
      cursorColor: const Color.fromRGBO(32,206,202, 1),
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
        ),
        labelText: 'Card Number',
        hintText: 'XXXX XXXX XXXX XXXX',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        counterText: '',
        suffixIcon: IconButton(
          onPressed: () {
            cardNumberController.clear();
            cardNumber.value = 'XXXX XXXX XXXX XXXX';
          },
          icon: const Icon(Icons.clear, color: Colors.grey),
        ),
      ),
      controller: cardNumberController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
      maxLength: 16,
      onChanged: (value) {
        value = value.replaceAll(RegExp(r"\D"), "");
        switch (value.length) {
          case 0:
            cardNumberController.text = "XXXX XXXX XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 0);
            cardNumber.value = cardNumberController.text;
            break;
          case 1:
            cardNumberController.text = "${value}XXX XXXX XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 1);
            cardNumber.value = cardNumberController.text;
            break;
          case 2:
            cardNumberController.text = "${value}XX XXXX XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 2);
            cardNumber.value = cardNumberController.text;
            break;
          case 3:
            cardNumberController.text = "${value}X XXXX XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 3);
            cardNumber.value = cardNumberController.text;
            break;
          case 4:
            cardNumberController.text = "${value.substring(0, 4)} XXXX XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 4);
            cardNumber.value = cardNumberController.text;
            break;
          case 5:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4)}XXX XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 6);
            cardNumber.value = cardNumberController.text;
            break;
          case 6:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 6)}XX XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 7);
            cardNumber.value = cardNumberController.text;
            break;
          case 7:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 7)}X XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 8);
            cardNumber.value = cardNumberController.text;
            break;
          case 8:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} XXXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 9);
            cardNumber.value = cardNumberController.text;
            break;
          case 9:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8)}XXX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 11);
            cardNumber.value = cardNumberController.text;
            break;
          case 10:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, 10)}XX XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 12);
            cardNumber.value = cardNumberController.text;
            break;
          case 11:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, 11)}X XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 13);
            cardNumber.value = cardNumberController.text;
            break;
          case 12:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, 12)} XXXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 14);
            cardNumber.value = cardNumberController.text;
            break;
          case 13:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, 12)} ${value.substring(12)}XXX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 16);
            cardNumber.value = cardNumberController.text;
            break;
          case 14:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, 12)} ${value.substring(12, 14)}XX";
            cardNumberController.selection = const TextSelection.collapsed(offset: 17);
            cardNumber.value = cardNumberController.text;
            break;
          case 15:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, 12)} ${value.substring(12, 15)}X";
            cardNumberController.selection = const TextSelection.collapsed(offset: 18);
            cardNumber.value = cardNumberController.text;
            break;
          case 16:
            cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, 12)} ${value.substring(12)}";
            cardNumberController.selection = const TextSelection.collapsed(offset: 19);
            cardNumber.value = cardNumberController.text;
            break;
        }
        if (value.length > 16) {
          cardNumberController.text = "${value.substring(0, 4)} ${value.substring(4, 8)} ${value.substring(8, 12)} ${value.substring(12)}";
          cardNumberController.selection = const TextSelection.collapsed(offset: 19);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your card number.';
        }
      },
    ),
  );
}