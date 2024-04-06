enum SystemColors { vividGamboge, eerieBlack, darkLiver, lightGray }

extension ExtensionColors on SystemColors {
  String toValue() {
    Map map = {
      SystemColors.lightGray: '#D4D4D2',
      SystemColors.eerieBlack: '#1C1C1C',
      SystemColors.darkLiver: ' #505050',
      SystemColors.vividGamboge: '#FF9500',
    };

    return map[this];
  }
}
