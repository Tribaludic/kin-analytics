import 'dart:math';

import 'package:awesome_card/extra/card_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_strings.dart';
import 'package:flutter_app/src/pages/credit_card/credit_card_model.dart';
import 'package:flutter_app/src/service/mock_service.dart';
import 'package:flutter_app/src/widgets/alert_modal.dart';
import 'package:flutter_app/src/widgets/loading.dart';
import 'package:rxdart/rxdart.dart';

class CreditCardPageController{

  late final CreditCardModel creditCardModel;

  late final BehaviorSubject<CreditCardModel> creditCardBehavior;

  late TextEditingController bankNameController;
  late TextEditingController expDateController;
  late TextEditingController cardNumberController;
  late TextEditingController cardHolderNameController;
  late TextEditingController cardCVVController;

  void initController(){
    creditCardModel = CreditCardModel();
    creditCardBehavior = BehaviorSubject<CreditCardModel>();
    bankNameController = TextEditingController();
    expDateController = TextEditingController();
    cardNumberController = TextEditingController();
    cardHolderNameController = TextEditingController();
    cardCVVController = TextEditingController();
  }

  void dispose(){
    creditCardBehavior.close();
    bankNameController.dispose();
    expDateController.dispose();
    cardNumberController.dispose();
    cardHolderNameController.dispose();
    cardCVVController.dispose();
  }

  CreditCardModel get initCreditCardData => creditCardModel;


  Future<void> onCardNumberChange(String value)async{

    creditCardModel.showBackSide = false;

    if(value.length>16){
      cardNumberController.text = value.substring(0,16);
      cardNumberController.selection = TextSelection.fromPosition(TextPosition(offset: cardNumberController.text.length));
    }

    creditCardModel.cardNumber = _formatCreditCardNumber(cardNumberController.text);
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

  String _formatCreditCardNumber(String value){
    return value.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
  }

  String _formatCreditCardExpirationDate(String value){
    return value.replaceAllMapped(RegExp(r".{2}"), (match) => "${match.group(0)}/");
  }

  Future<void> onBankNameChange(String value)async{
    creditCardModel.bankName = value;
    creditCardModel.showBackSide = false;
    creditCardBehavior.add(creditCardModel);
  }

  Future<void> onExpDateChange(String value)async{

    if(value.length>5){
      expDateController.text = value.substring(0,5);
      expDateController.selection = TextSelection.fromPosition(TextPosition(offset: expDateController.text.length));
    }else if(value.length == 2 && creditCardModel.cardExpiry.length < value.length){
      value+='/';
      expDateController.clear();
      expDateController.text = value;
      expDateController.selection = TextSelection.fromPosition(TextPosition(offset: expDateController.text.length));

    }
    creditCardModel.cardExpiry = value;
    creditCardModel.showBackSide = false;
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
      cardCVVController.selection = TextSelection.fromPosition(TextPosition(offset: cardCVVController.text.length));
    }

    creditCardModel.cvv = cardCVVController.text;
    creditCardModel.showBackSide = true;
    creditCardBehavior.add(creditCardModel);

  }

  Future<void> onPayTap(context)async{

    if(creditCardModel.haveEmptyValues){
      await AlertModal.show(
          context:context,
          data:const AlertModalData(
              iconData:Icons.error,
              iconColor: Colors.red,
              title: AppStrings.invalidData,
              message: AppStrings.creditCardEmptyField
          ));
      return;
    }

    Loading.show(context, AppStrings.payLoading);
    await Future.delayed(const Duration(seconds: 3));
    Loading.close(context);



    List<String> expData = creditCardModel.cardExpiry.split('/');
    final int month = int.parse(expData[0]);
    final int year = int.parse(expData[1]);



    if(month>12 || year < 22 ){
      await AlertModal.show(
          context:context,
          data:const AlertModalData(
              iconData:Icons.error,
              iconColor: Colors.red,
              title: AppStrings.payError,
              message: AppStrings.invalidExpirationDate
          ));
      return;
    }

    final bool result = await MockService.pay();

   if(result){
     await AlertModal.show(
         context:context,
         data:const AlertModalData(
             iconData:Icons.check_circle,
             iconColor: Colors.green,
             title: AppStrings.payingComplete,
             message: AppStrings.successfulPayingMessage
         ));
   }else{
     await AlertModal.show(
         context:context,
         data:const AlertModalData(
             iconData:Icons.error,
             iconColor: Colors.red,
             title: AppStrings.payError,
             message: AppStrings.payErrorServer
         ));

   }






  }


  String get payAmount => '${AppStrings.pay}      \$${Random().nextInt(101)} USD';

}