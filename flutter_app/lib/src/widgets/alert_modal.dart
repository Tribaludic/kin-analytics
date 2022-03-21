import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_decoration.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';
import 'circle_button.dart';


class AlertModal extends StatelessWidget {

  final AlertModalData data;

  const AlertModal(this.data,{Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(decoration: AppDecoration.titledBackground),
            Column(
                children: <Widget>[
                  const SizedBox(height: 25,),
                  Expanded(
                    flex: 3,
                    child: Icon(
                      data.iconData,
                      color: data.iconColor,
                      size: AppDecoration.alertIconSize,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      //color: Colors.green,
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
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
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20,),
                        CircleButton(callback: () => Navigator.pop(context),
                          color: AppColors.secondaryColor,
                            iconData: Icons.close,
                            ),
                      ],
                    ),
                  ),
                ])
          ],

        ),
      ),
    );
  }

  static Future<void> show({required BuildContext context, required AlertModalData data}) async
  {
    await Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => AlertModal(data),
            fullscreenDialog: true
        )
    );
  }

}

class AlertModalData{
  final IconData iconData;
  final String title;
  final String message;
  final Color iconColor;

  const AlertModalData({required this.iconData, required this.title,required this.message, this.iconColor=AppColors.secondaryColor});
}
