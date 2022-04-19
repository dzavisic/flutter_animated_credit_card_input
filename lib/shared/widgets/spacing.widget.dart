import 'package:animated_card_input/shared/interfaces/orientation.interface.dart';
import 'package:flutter/material.dart';

OrientationType orientationType = OrientationType();

Widget xsSpacing(orientation) {
  if (orientation == orientationType.Horizontal) {
    return const SizedBox(
      width: 5,
    );
  }
  return const SizedBox(
    height: 5,
  );
}

Widget sSpacing(orientation) {
  if (orientation == orientationType.Horizontal) {
    return const SizedBox(
      width: 15,
    );
  }
  return const SizedBox(
    height: 15,
  );
}

Widget mSpacing(orientation) {
  if (orientation == orientationType.Horizontal) {
    return const SizedBox(
      width: 30,
    );
  }
  return const SizedBox(
    height: 30,
  );
}

Widget mlSpacing(orientation) {
  if (orientation == orientationType.Horizontal) {
    return const SizedBox(
      width: 40,
    );
  }
  return const SizedBox(
    height: 40,
  );
}

Widget lSpacing(orientation) {
  if (orientation == orientationType.Horizontal) {
    return const SizedBox(
      width: 60,
    );
  }
  return const SizedBox(
    height: 60,
  );
}

Widget xlSpacing(orientation) {
  if (orientation == orientationType.Horizontal) {
    return const SizedBox(
      width: 90,
    );
  }
  return const SizedBox(
    height: 90,
  );
}

Widget xxlSpacing(orientation) {
  if (orientation == orientationType.Horizontal) {
    return const SizedBox(
      width: 130,
    );
  }
  return const SizedBox(
    height: 130,
  );
}