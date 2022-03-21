class ValidationUtils{

  static bool isValidUsername(String value) {
    return value.length >= 4;
  }

  static bool isValidPassword(String value) {
    return value.length >= 6;
  }

  static bool isValidCreditCard(String value) {
    const String pattern =
    r'''^(?: 
          (?<visa>4[0-9]{12}(?:[0-9]{3})?) |
    (?<mastercard>5[1-5][0-9]{14}) |
    (?<discover>6(?:011|5[0-9]{2})[0-9]{12}) |
    (?<amex>3[47][0-9]{13}) |
    (?<diners>3(?:0[0-5]|[68][0-9])[0-9]{11}) |
    (?<jcb>(?:2131|1800|35[0-9]{3})[0-9]{11})
    )$''';
    final RegExp regex = RegExp(pattern);

    if (regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }
}