import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_routes.dart';
import 'package:flutter_app/src/app_settings/app_strings.dart';
import 'package:flutter_app/src/widgets/confirmation_dialog_modal.dart';

class HomePageController{

  Future<void> onCreditCardTap(BuildContext context) async{
    await Navigator.pushReplacementNamed(context, AppRoutes.creditCard);
  }

  Future<void> onLogoutTap(BuildContext context)async{
    final bool? result = await ConfirmationDialogModal.show(
        context: context,
        data: const ConfirmationDialogModalData(
            iconData: Icons.exit_to_app,
            title: AppStrings.logout,
            message: AppStrings.logoutConfirmationMessage));

    if (result == true) {
      await Navigator.pushReplacementNamed(context, AppRoutes.login);
    }

  }
}