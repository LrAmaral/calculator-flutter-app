import 'package:flutter/material.dart';

enum SystemColors { vividGamboge, eerieBlack, darkLiver, lightGray }

extension ExtensionColors on SystemColors {
  Color toColor() {
    Map<SystemColors, Color> colorMap = {
      SystemColors.lightGray: const Color(0xFFD4D4D2),
      SystemColors.eerieBlack: const Color(0xFF1C1C1C),
      SystemColors.darkLiver: const Color(0xFF505050),
      SystemColors.vividGamboge: const Color(0xFFFF9500),
    };

    return colorMap[this]!;
  }
}