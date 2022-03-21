import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/credit_card/credit_card_page.dart';
import 'package:flutter_app/src/pages/home/home_page.dart';
import 'package:flutter_app/src/pages/login/login_page.dart';

class AppRoutes {
  static const String login = 'login';
  static const String home = 'home';
  static const String creditCard = 'creditCard';

  static Map<String, WidgetBuilder> getApplicationRoutes() {
    return <String, WidgetBuilder>{
      login: (BuildContext context) => const LoginPage(),
      home: (BuildContext context) => const HomePage(),
      creditCard: (BuildContext context) => const CreditCardPage(),
    };
  }

}