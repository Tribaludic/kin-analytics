
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_decoration.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';
import 'package:rxdart/rxdart.dart';

class PasswordInput extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;

  const PasswordInput({required this.controller,required this.hintText,Key? key}):super(key: key);


  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {

  BehaviorSubject<PasswordInputStreamData> dataBehaviorSubject = BehaviorSubject<PasswordInputStreamData>();
  PasswordInputStreamData streamDataObj = PasswordInputStreamData(Icons.visibility_off,true);

  List<TextInputFormatter> get inputFormatter => <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@!#$%^&*-_+=]'))
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PasswordInputStreamData>(
        stream: dataBehaviorSubject.stream,
        initialData: streamDataObj,
        builder: (BuildContext context, AsyncSnapshot<PasswordInputStreamData> snapshot) {
          return TextField(
            style: AppTextStyle.bodyText(),
            controller: widget.controller,
            inputFormatters: inputFormatter,
            obscureText: snapshot.data!.obscureText,
            keyboardType: TextInputType.visiblePassword,
            decoration: AppDecoration.inputDecoration(hintText: widget.hintText,
                icon: const Icon(Icons.lock, color: AppColors.secondaryColor),
                suffix: suffix(
                    snapshot.data!.visibilityIcon, AppColors.secondaryColor)),
          );
        });
  }

  Widget suffix(IconData icon, Color iconColor) {
    return SizedBox(
        height: 30,
        width: 42,
        child: IconButton(
            onPressed: onEyeButtonPressed,
            icon: Icon(
              icon,
              color: iconColor,
            )));
  }

  void onEyeButtonPressed()
  {
    streamDataObj.obscureText = !streamDataObj.obscureText;

    if (streamDataObj.obscureText) {
      streamDataObj.visibilityIcon = Icons.visibility_off;
    } else {
      streamDataObj.visibilityIcon = Icons.visibility;
    }
    dataBehaviorSubject.add(streamDataObj);
  }


}

class PasswordInputStreamData
{
  IconData visibilityIcon;
  bool obscureText;

  PasswordInputStreamData(this.visibilityIcon,this.obscureText);

}
