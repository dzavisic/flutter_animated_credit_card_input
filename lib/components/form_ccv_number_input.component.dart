import 'package:flutter/material.dart';

bool isFirstTap = true;

Widget ccvNumberInput(
  TextEditingController ccvController,
  ValueNotifier<String> ccv,
  _flip
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
        labelText: 'CCV',
        hintText: 'XXX',
        counterText: '',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            ccvController.clear();
            ccv.value = 'XXX';
          },
          icon: const Icon(Icons.clear, color: Colors.grey),
        ),
      ),
      controller: ccvController,
      keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
      onTap: () {
        if (isFirstTap) {
          _flip();
          isFirstTap = false;
        }
      },
      onChanged: (value) {
        value = value.replaceAll(RegExp(r"\D"), "");
        switch (value.length) {
          case 0:
            ccvController.text = "XXX";
            ccvController.selection = const TextSelection.collapsed(offset: 0);
            ccv.value = ccvController.text;
            break;
          case 1:
            ccvController.text = "${value}XX";
            ccvController.selection = const TextSelection.collapsed(offset: 1);
            ccv.value = ccvController.text;
            break;
          case 2:
            ccvController.text = "${value}X";
            ccvController.selection = const TextSelection.collapsed(offset: 2);
            ccv.value = ccvController.text;
            break;
          case 3:
            ccvController.text = value.substring(0, 3);
            ccvController.selection = const TextSelection.collapsed(offset: 3);
            ccv.value = ccvController.text;
            break;
        }
        if (value.length > 3) {
          ccvController.text = value.substring(0, 3);
          ccvController.selection = const TextSelection.collapsed(offset: 3);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your ccv number.';
        }
      },
    ),
  );
}