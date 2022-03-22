import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/Utils/input_formatter_utils.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_decoration.dart';
import 'package:flutter_app/src/app_settings/app_strings.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';
import 'package:flutter_app/src/pages/credit_card/credit_card_model.dart';
import 'package:flutter_app/src/pages/credit_card/credit_card_page_controller.dart';
import 'package:flutter_app/src/widgets/rectangle_button.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  CreditCardPageController pageController = CreditCardPageController();

  @override
  void initState() {
    super.initState();
    pageController.initController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SafeArea(
            child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(AppStrings.creditCard),
        centerTitle: true,
        backgroundColor: AppColors.secondaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<CreditCardModel>(
              stream: pageController.creditCardBehavior.stream,
              initialData: pageController.initCreditCardData,
              builder: (context, snapshot) {
                return CreditCard(
                    cardNumber: snapshot.data!.cardNumber,
                    cardExpiry: snapshot.data!.cardExpiry,
                    cardHolderName: snapshot.data!.cardHolderName,
                    cvv: snapshot.data!.cvv,
                    bankName: snapshot.data!.bankName,
                    cardType: snapshot.data!.cardType,
                    showBackSide: snapshot.data!.showBackSide,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    textExpDate: AppStrings.expirationDateLabel,
                    textName: AppStrings.cardOwnerName,
                    textExpiry: AppStrings.expirationDateHint);
              }),
          const SizedBox(
            height: 20,
          ),
          TextField(
              style: AppTextStyle.bodyText(),
              controller: pageController.bankNameController,
              inputFormatters: InputFormatterUtils.textInputFormatter,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              onChanged: pageController.onBankNameChange,
              decoration: AppDecoration.inputDecoration(
                  hintText: AppStrings.bankName,
                  icon: const Icon(
                    Icons.account_balance,
                    color: AppColors.secondaryColor,
                  ))),
          TextField(
              style: AppTextStyle.bodyText(),
              controller: pageController.cardNumberController,
              inputFormatters: InputFormatterUtils.numbersOnlyInputFormatter,
              keyboardType: TextInputType.number,
              onChanged: pageController.onCardNumberChange,
              decoration: AppDecoration.inputDecoration(
                  hintText: AppStrings.cardNumber,
                  icon: const Icon(
                    Icons.credit_card,
                    color: AppColors.secondaryColor,
                  ))),
          TextField(
              style: AppTextStyle.bodyText(),
              controller: pageController.cardHolderNameController,
              inputFormatters: InputFormatterUtils.cardHolderInputFormatter,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              onChanged: pageController.onCardHolderChange,
              decoration: AppDecoration.inputDecoration(
                  hintText: AppStrings.cardOwnerName,
                  icon: const Icon(
                    Icons.person_rounded,
                    color: AppColors.secondaryColor,
                  ))),
          TextField(
              style: AppTextStyle.bodyText(),
              controller: pageController.expDateController,
              inputFormatters: InputFormatterUtils.expirationDateInputFormatter,
              keyboardType: TextInputType.number,
              onChanged: pageController.onExpDateChange,
              decoration: AppDecoration.inputDecoration(
                  hintText: AppStrings.expirationDateHint,
                  icon: const Icon(
                    Icons.calendar_today,
                    color: AppColors.secondaryColor,
                  ))),
          TextField(
              obscureText: true,
              style: AppTextStyle.bodyText(),
              controller: pageController.cardCVVController,
              inputFormatters: InputFormatterUtils.numbersOnlyInputFormatter,
              keyboardType: TextInputType.number,
              onChanged: pageController.onCardCVVChange,
              decoration: AppDecoration.inputDecoration(
                  hintText: AppStrings.cardCvv,
                  icon: const Icon(
                    Icons.key,
                    color: AppColors.secondaryColor,
                  ))),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: RectangleButton(text: pageController.payAmount, callback: () => pageController.onPayTap(context) ,color: AppColors.secondaryColor),
          ),
        ],
      ),
    )));
  }
}
