import 'dart:math';

import 'package:animated_card_input/components/card_back.component.dart';
import 'package:animated_card_input/components/card_front.component.dart';
import 'package:animated_card_input/components/form.component.dart';
import 'package:animated_card_input/shared/interfaces/orientation.interface.dart';
import 'package:animated_card_input/shared/widgets/spacing.widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String bankName = 'Bank Name';
  ValueNotifier<String> cardNumber = ValueNotifier('XXXX XXXX XXXX XXXX');
  ValueNotifier<String> cardholderName = ValueNotifier('John Doe');
  ValueNotifier<String> validThru = ValueNotifier('MM/YY');
  ValueNotifier<String> ccv = ValueNotifier('XXX');
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardholderNameController = TextEditingController();
  final TextEditingController validThruController = TextEditingController();
  final TextEditingController ccvController = TextEditingController();
  OrientationType orientationType = OrientationType();
  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color.fromRGBO(32,206,202, 1),
        ),
        body: Column(
          children: [
            mSpacing(orientationType.Vertical),
            /// CARD WIDGET
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: angle),
              duration: const Duration(seconds: 1),
              builder: (BuildContext context, double val, __) {
                (val >= pi / 2) ? isBack = false : isBack = true;
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(val),
                  child: Container(
                    child: isBack ?
                    cardFront(context, cardNumber, cardholderName, validThru, bankName)
                      : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(pi),
                        child: cardBack(context, ccv)
                    ),
                  ),
                ));
              }
            ),
            lSpacing(orientationType.Vertical),
            /// CARD INPUT FORM
            form(
              cardNumberController,
              cardNumber,
              cardholderNameController,
              cardholderName,
              validThruController,
              validThru,
              ccvController,
              ccv,
              _flip
            )
          ],
        )
    );
  }
}