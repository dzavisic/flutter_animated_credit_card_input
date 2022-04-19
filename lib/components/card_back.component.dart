import 'package:animated_card_input/components/card_ccv.component.dart';
import 'package:animated_card_input/shared/interfaces/orientation.interface.dart';
import 'package:animated_card_input/shared/widgets/spacing.widget.dart';
import 'package:flutter/material.dart';

OrientationType orientationType = OrientationType();

Widget cardBack(
    BuildContext context,
    ValueNotifier<String> ccvNumber
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
        mlSpacing(orientationType.Vertical),
        blackSection(context),
        sSpacing(orientationType.Vertical),
        ccv(context, ccvNumber),
        mSpacing(orientationType.Vertical),
        someTextOrImg()
      ],
    ),
  );
}

Widget blackSection(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    color: Colors.black,
  );
}

Widget someTextOrImg() {
  return const SizedBox(
    width: 200,
    height: 40,
    child: Text('Everything is customizable', style: TextStyle(fontSize: 15)),
  );
}