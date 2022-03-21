import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_strings.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';
import 'package:flutter_app/src/pages/home/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomePageController pageController = HomePageController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: AppColors
                .backgroundColor, //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    AppStrings.creditCard,
                    style: AppTextStyle.bodyText(),
                  ),
                  onTap: () => pageController.onCreditCardTap(context),
                  trailing: const Icon(Icons.credit_card, color: Colors.black),
                ),
                ListTile(
                  title: Text(
                   AppStrings.logout,
                    style: AppTextStyle.bodyText(),
                  ),
                  onTap: ()=> pageController.onLogoutTap(context),
                  trailing: const Icon(Icons.logout, color: Colors.black),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(AppStrings.homeTitle),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: const SizedBox(),
      ),
    );
  }
}
