import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_decoration.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';

class UsernameInput extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  const UsernameInput({required this.controller,required this.hintText, Key? key}):super(key: key);

  @override
  _UsernameInputState createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {

  List<TextInputFormatter> get inputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(   RegExp(r'[A-Za-z]'))
  ];

  @override
  Widget build(BuildContext context) {

    return TextField(
      style: AppTextStyle.bodyText(),
      controller: widget.controller,
      inputFormatters: inputFormatter,
      keyboardType: TextInputType.name,
      decoration: AppDecoration.inputDecoration(hintText: widget.hintText,
          icon: const Icon(Icons.person_rounded, color: AppColors.secondaryColor,)
      ),
    );
  }

}



