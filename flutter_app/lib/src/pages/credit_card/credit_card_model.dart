import 'dart:ffi';

import 'package:awesome_card/extra/card_type.dart';

class CreditCardModel{
  String cardNumber = '';
  String cardExpiry = '';
  String cardHolderName = '';
  String cvv = '';
  String bankName = '';
  CardType cardType = CardType.masterCard;
  bool showBackSide = false;

  bool get haveEmptyValues =>
      cardNumber.isEmpty ||
      cardExpiry.isEmpty ||
      cardHolderName.isEmpty ||
      cvv.isEmpty ||
      bankName.isEmpty ||
      cardNumber.length<16;

}

