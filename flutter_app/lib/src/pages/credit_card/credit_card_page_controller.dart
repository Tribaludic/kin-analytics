import 'package:awesome_card/extra/card_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/credit_card/credit_card_model.dart';
import 'package:rxdart/rxdart.dart';

class CreditCardPageController{

  late final CreditCardModel creditCardModel;

  late final BehaviorSubject<CreditCardModel> creditCardBehavior;

  late TextEditingController cardNumberController;
  late TextEditingController cardHolderNameController;
  late TextEditingController cardCVVController;

  void initController(){
    creditCardModel = CreditCardModel();
    creditCardBehavior = BehaviorSubject<CreditCardModel>();
    cardNumberController = TextEditingController();
    cardHolderNameController = TextEditingController();
    cardCVVController = TextEditingController();
  }

  void dispose(){
    creditCardBehavior.close();
    cardNumberController.dispose();
    cardHolderNameController.dispose();
    cardCVVController.dispose();
  }

  CreditCardModel get initCreditCardData => creditCardModel;


  Future<void> onCardNumberChange(String value)async{

    creditCardModel.showBackSide = false;

    if(value.length>16){
      cardNumberController.text = value.substring(0,16);
    }

    creditCardModel.cardNumber = cardNumberController.text;
    if(value.length>1){
      if(value[0]=='3'){
        creditCardModel.cardType = CardType.dinersClub;
      }else if(value[0]=='4'){
        creditCardModel.cardType = CardType.visa;
      }else if(value[0]=='5'){
        creditCardModel.cardType = CardType.masterCard;
      }else if(value[0]=='6'){
        creditCardModel.cardType = CardType.discover;
      }
      else{
        creditCardModel.cardType = CardType.americanExpress;
      }
    }

    creditCardBehavior.add(creditCardModel);
  }

  Future<void> onCardHolderChange(String value)async{
    creditCardModel.cardHolderName = value;
    creditCardModel.showBackSide = false;
    creditCardBehavior.add(creditCardModel);
  }

  Future<void> onCardCVVChange(String value)async{

    if(value.length>3){
      cardCVVController.text = value.substring(0,3);
    }

    creditCardModel.cvv = cardCVVController.text;
    creditCardModel.showBackSide = true;
    creditCardBehavior.add(creditCardModel);

  }

}