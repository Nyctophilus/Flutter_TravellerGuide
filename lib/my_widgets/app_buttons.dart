import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/my_widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundcolor;
  double size;
  String? text;
  IconData? icon;
  final Color borderColor;
  bool isIcon;

  AppButtons(
      {Key? key,
      this.text,
      this.icon,
      this.isIcon = false,
      required this.size,
      required this.color,
      required this.backgroundcolor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundcolor,
          border: Border.all(color: borderColor, width: 1.0)),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
