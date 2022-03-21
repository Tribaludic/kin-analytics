import 'package:flutter/services.dart';

class InputFormatterUtils{

  static List<TextInputFormatter> get usernameInputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]'))
  ];

  static List<TextInputFormatter> get cardHolderInputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z ]'))
  ];

  static List<TextInputFormatter> get numberInputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
  ];

}