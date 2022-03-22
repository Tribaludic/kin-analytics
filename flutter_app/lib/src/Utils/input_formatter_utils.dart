import 'package:flutter/services.dart';

class InputFormatterUtils{

  static List<TextInputFormatter> get textInputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z ]'))
  ];

  static List<TextInputFormatter> get cardHolderInputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z ]'))
  ];

  static List<TextInputFormatter> get numbersOnlyInputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
  ];

  static List<TextInputFormatter> get expirationDateInputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9/]'))
  ];

}