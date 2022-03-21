import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_decoration.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';
import 'circle_button.dart';

class ConfirmationDialogModal extends StatelessWidget {

  final ConfirmationDialogModalData data;

  // ignore: sort_constructors_first
  const ConfirmationDialogModal(this.data,{Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(decoration: AppDecoration.titledBackground),
            Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 50, top: 50, right: 50),
                      child: Icon(
                        data.iconData,
                        color: AppColors.secondaryColor,
                        size: AppDecoration.alertIconSize,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0,top: 20),
                      //color: Colors.deepPurple,
                      child: Column(
                        children: <Widget>[
                          Text(
                              data.title,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.titleText()
                          ),
                          const Divider(color: AppColors.primaryColor),
                          const SizedBox(height: 25),
                          Text(
                              data.message,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.headerText()
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CircleButton(callback:
                                      () =>Navigator.pop(context, false),
                                  color: AppColors.secondaryColor,
                                    iconData: Icons.close,
                                    ),
                                CircleButton(callback:
                                    ()=>Navigator.pop(context, true),
                                    iconData: Icons.check
                                        ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            )
          ],

        ),
      ),
    );
  }

  // void _onCancelButtonClicked(BuildContext context) {
  //   Navigator.pop(context, false);
  // }
  //
  // void _onAcceptedButtonClicked(BuildContext context) {
  //   Navigator.pop(context, true);
  // }

  static Future<bool?> show({required BuildContext context,required ConfirmationDialogModalData data}) async
  {
    return await Navigator.push(
        context,
        MaterialPageRoute<bool>(
            builder: (BuildContext context) => ConfirmationDialogModal(data),
            fullscreenDialog: true)
    );
  }
}

class ConfirmationDialogModalData{
  final IconData iconData;
  final String title;
  final String message;

  const ConfirmationDialogModalData({required this.iconData,required this.title,required this.message});
}
