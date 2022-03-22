import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';
import 'package:rxdart/rxdart.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading{

  static BehaviorSubject<String>? loadingMessageBehavior;
  static BehaviorSubject<Widget>? loadingIconBehavior;

  static Widget defaultIcon(){
    return  LoadingAnimationWidget.discreteCircle(
      color: Colors.white,
      secondRingColor: AppColors.primaryColor,
      size: 40,
    );
  }

  static Widget validatingIcon(){
    return  LoadingAnimationWidget.threeArchedCircle(
      color: Colors.orange,
      size: 40,
    );
  }


  static void show(BuildContext context, String message){
    loadingMessageBehavior = BehaviorSubject<String>();
    loadingIconBehavior = BehaviorSubject<Widget>();

    final AlertDialog alert=AlertDialog(
      backgroundColor: AppColors.blackTransparent,
      shape: RoundedRectangleBorder(  side: const BorderSide( color: AppColors.primaryColor) ,borderRadius: BorderRadius.circular(20.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          StreamBuilder<Widget>(
              stream: loadingIconBehavior!.stream,
              initialData: defaultIcon(),
              builder: (context, snapshot) {
                return snapshot.data!;
              }
          ),
          Container(margin: const EdgeInsets.only(top: 15),child:
          StreamBuilder<String>(
              stream: loadingMessageBehavior!.stream,
              initialData: message,
              builder: (context, snapshot) {
                return Text(snapshot.data!, style: AppTextStyle.bodyText(color: Colors.white),);
              }
          )),
        ],),
    );
    showDialog<void>(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  static void updateLoading(String message,{bool icon=true}){
    loadingMessageBehavior!.add(message);

    if(icon){
      loadingIconBehavior!.add(defaultIcon());
    }else{
      loadingIconBehavior!.add(validatingIcon());
    }

  }

  static void close(BuildContext context)
  {
    loadingMessageBehavior!.close();
    loadingIconBehavior!.close();
    Navigator.pop(context);
  }


}