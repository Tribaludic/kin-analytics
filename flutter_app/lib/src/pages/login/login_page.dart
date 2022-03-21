import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_decoration.dart';
import 'package:flutter_app/src/app_settings/app_strings.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';
import 'package:flutter_app/src/pages/login/login_page_controller.dart';
import 'package:flutter_app/src/widgets/password_input.dart';
import 'package:flutter_app/src/widgets/rectangle_button.dart';
import 'package:flutter_app/src/widgets/username_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginPageController pageController = LoginPageController();

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
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: AppDecoration.titledBackground,
            ),
            ListView(
              padding: const EdgeInsets.only(left: 50.0,right: 50.0),
              children: <Widget>[
                const SizedBox(height: 100.0),
                Text(AppStrings.appTitle, textAlign: TextAlign.center, style: AppTextStyle.displayText(),),
                const SizedBox(height: 50.0),
                UsernameInput(controller: pageController.usernameInputController, hintText: AppStrings.username),
                PasswordInput(controller: pageController.passwordInputController, hintText: AppStrings.password),
                const SizedBox(height: 50.0),
                RectangleButton(text: AppStrings.login, callback: () => pageController.onLoginButtonClicked(context) ,color: AppColors.secondaryColor),
                const SizedBox( height: 10.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}
