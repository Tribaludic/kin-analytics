import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';


class CircleButton extends StatelessWidget {

  final VoidCallback callback;
  final IconData iconData;
  final Color color;
  final bool isOutline;
  final double radio;

  const CircleButton({required this.callback,
  Key? key,required this.iconData,
  this.color = AppColors.primaryColor,
  this.isOutline = false,
  this.radio = 55}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 4,
      onPressed: callback,
      color: color,
      shape: const CircleBorder(),
      child: Icon(iconData, color: Colors.white, size: radio/2 ),
      height: radio,
    );
  }


}
