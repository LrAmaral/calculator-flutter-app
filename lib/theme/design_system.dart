import 'package:flutter/material.dart';

enum SystemColors { vividGamboge, eerieBlack, darkLiver, lightGray }

extension ExtensionColors on SystemColors {
  Color toColor() {
    Map<SystemColors, Color> colorMap = {
      SystemColors.lightGray: const Color.fromRGBO(212, 212, 210, 1),
      SystemColors.eerieBlack: const Color.fromRGBO(28, 28, 28, 1),
      SystemColors.darkLiver: const Color.fromRGBO(80, 80, 80, 1),
      SystemColors.vividGamboge: const Color.fromRGBO(255, 149, 0, 1),
    };

    return colorMap[this]!;
  }
}