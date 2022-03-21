
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/app_settings/app_colors.dart';
import 'package:flutter_app/src/app_settings/app_decoration.dart';
import 'package:flutter_app/src/app_settings/app_text_styles.dart';

import 'circle_button.dart';

class TextPromptModal extends StatefulWidget {

  final TextPromptModalData data;

  const TextPromptModal({Key? key, required this.data}):super(key: key);

  @override
  State<TextPromptModal> createState() => _TextPromptModalState();

  static Future<String?> show({required BuildContext context, required TextPromptModalData data}) async
  {
    return await Navigator.push(
        context,
        MaterialPageRoute<String>(
            builder: (BuildContext context) => TextPromptModal(data: data),
            fullscreenDialog: true)
    );
  }
}

class _TextPromptModalState extends State<TextPromptModal> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.data.text;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // if(widget.data.text.isNotEmpty){
    //   textController.text = widget.data.text;
    // }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(decoration: AppDecoration.titledBackground),
            Container(
              padding: const EdgeInsets.all(40),
              child: ListView(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0,top: 20),
                      //color: Colors.deepPurple,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 25),
                          TextField(
                            textAlign: TextAlign.center,
                            textCapitalization: widget.data.capitalization,
                            controller: textController,
                            style: AppTextStyle.bodyText(),
                            keyboardType: widget.data.keyboardType,
                            inputFormatters: widget.data.inputFormatter,
                            decoration:  AppDecoration.inputDecoration(hintText: widget.data.hintText),
                            maxLength: widget.data.maxLength,
                            autofocus: widget.data.autofocus,
                          ),
                          Text(
                              widget.data.infoText,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.smallText()
                          ),

                          // Text(
                          //     'do not include country code',
                          //     textAlign: TextAlign.center,
                          //     style: AppTextStyle.smallText
                          // )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 50.0, top: 120.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircleButton(
                                  color: AppColors.secondaryColor,
                                  iconData: Icons.close,
                                  callback: () =>
                                      _onCancelButtonClicked(context)),
                              CircleButton(
                                  iconData: Icons.check,
                                  callback: () =>
                                      _onAcceptedButtonClicked(context)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            )
          ],

        ),
      ),
    );
  }

  void _onCancelButtonClicked(BuildContext context) {
    Navigator.pop(context, null);
  }

  void _onAcceptedButtonClicked(BuildContext context) {
    Navigator.pop(context, textController.text);
  }
}
class TextPromptModalData{
  final String text;
  final String hintText;
  final String infoText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final TextCapitalization capitalization;
  final int? maxLength;
  final bool autofocus;

  const TextPromptModalData({
    required this.infoText,
    this.text = '',
    this.hintText = '',
    required this.keyboardType,
    this.capitalization = TextCapitalization.none,
    required this.inputFormatter,
    this.maxLength,
  this.autofocus = false});
}