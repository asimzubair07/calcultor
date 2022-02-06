import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTextFiled extends StatefulWidget {
  final String heading;
  final String hintText;
  final TextEditingController controller;
  final bool hideText;
  final TextInputType keybardType;
  final TextInputAction textInputAction;
  final Color headingColor;
  final FocusNode focusNode;
  final Widget suffixIcon;
  final Function onChanged;
  final Function validation;
  final Function onTap;
  const AuthTextFiled(
      {Key key,
      this.hintText = '',
      @required this.controller,
      this.hideText = false,
      @required this.keybardType,
      this.onChanged,
      @required this.suffixIcon,
      @required this.validation,
      this.headingColor = Colors.yellow,
      @required this.onTap,
      this.heading = "Heading",
      @required this.focusNode,
      this.textInputAction = TextInputAction.next})
      : super(key: key);
  @override
  _AuthTextFiledState createState() => _AuthTextFiledState();
}

class _AuthTextFiledState extends State<AuthTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged as Function(String),
      controller: widget.controller,
      obscureText: widget.hideText,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keybardType,
      validator: widget.validation as String Function(String),
      onTap: widget.onTap as void Function(),
      focusNode: widget.focusNode,
      style: const TextStyle(color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
          labelText: widget.heading,
          suffixIcon: widget.suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              borderSide: BorderSide(color: Colors.black, width: 2)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              borderSide: BorderSide(
                  color: Colors.deepPurple,
                  width: 1,
                  style: BorderStyle.solid)),
          // filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.brown, fontSize: 14),
          focusColor: Colors.black87,
          labelStyle: TextStyle(
              color: widget.focusNode.hasFocus ? Colors.black : Colors.black)
          // fillColor: AppColor.primaryColor
          ),
    );
  }
}
