import 'package:awesome_card/extra/card_type.dart';

class CreditCardModel{
  String cardNumber = '';
  String cardExpiry = '';
  String cardHolderName = '';
  String cvv = '';
  String bankName = '';
  CardType cardType = CardType.masterCard;
  bool showBackSide = false;
}

