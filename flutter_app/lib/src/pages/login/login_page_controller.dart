import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/Utils/validation_utils.dart';
import 'package:flutter_app/src/app_settings/app_routes.dart';
import 'package:flutter_app/src/app_settings/app_strings.dart';
import 'package:flutter_app/src/widgets/alert_modal.dart';

class LoginPageController {

  late final TextEditingController usernameInputController;
  late final TextEditingController passwordInputController;

  void initController(){
    usernameInputController = TextEditingController();
    passwordInputController = TextEditingController();
  }



  Future<void> onLoginButtonClicked(BuildContext context) async {

    final String email = usernameInputController.text;
    final String password = passwordInputController.text;

    if(!ValidationUtils.isValidUsername(email)){
      await AlertModal.show(context:context, data: const AlertModalData(
        iconData: Icons.error_outline,
        title: AppStrings.invalidUsername,
        message: AppStrings.invalidUsernameMessage,
      )
      );
      return;
    }

    if(!ValidationUtils.isValidPassword(password)){
      await AlertModal.show(
          context: context,
          data:  const AlertModalData(
            iconData: Icons.error_outline,
            title: AppStrings.invalidPassword,
            message: AppStrings.invalidPasswordMessage,
          )
      );
      return;
    }

    await Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  void dispose(){
    usernameInputController.dispose();
    passwordInputController.dispose();
  }



}