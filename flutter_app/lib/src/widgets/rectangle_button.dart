import 'package:flutter/material.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_decoration.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';

class RectangleButton extends StatelessWidget {

  final VoidCallback callback;
  final String text;
  final Color color;
  final IconData? iconData;
  final bool isOutlined;
  final double width;
  final double height;

  const RectangleButton({required this.text, required this.callback, this.color=AppColors.primaryColor,this.isOutlined = false, this.iconData, this.width=240, this.height=45, Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOutlined?outlineStyle():normalStyle();
  }

  OutlinedButton outlineStyle() => OutlinedButton(
      onPressed: callback,
      style: OutlinedButton.styleFrom(
          shape:  AppDecoration.rectangleButtonBorder
          ),
      //color: Colors.transparent,
      child: Text(text, style: AppTextStyle.bodyText(color: Colors.black))
  );

  Container normalStyle() => Container(
    width: width,
    height: height,
    child: GestureDetector(
      onTap: callback,
      child: Card(
        elevation: 4,
        color: color,
        semanticContainer: true,
        shape: AppDecoration.rectangleRoundedBorder(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(iconData, color: Colors.white, size: 19,),
            Text(text, style: AppTextStyle.bodyText(color: Colors.white)),
            const SizedBox(width: 15,)
          ],
        ),
      ),
    ),
  );

}
