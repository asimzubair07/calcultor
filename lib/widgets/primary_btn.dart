import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double width;
  final Color backColor;
  final Color textColor;
  final double height;
  final TextStyle textStyle;
  const PrimaryButton(
      {this.onTap,
      this.text,
      this.width = 200,
      this.height = 53.0,
      this.backColor = Colors.deepPurple,
      this.textColor = Colors.white,
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width == null ? MediaQuery.of(context).size.width : width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: backColor,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
          child: Text(
            text ?? "",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textStyle == null
                ? TextStyle(
                    color: textColor, fontSize: 14, fontWeight: FontWeight.w500)
                : textStyle,
          ),
          onPressed: onTap as void Function()),
    );
  }
}
