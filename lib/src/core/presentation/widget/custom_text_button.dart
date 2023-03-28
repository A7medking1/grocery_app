import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;

  final double fontSize;

  final Color fontColor;
  final void Function() onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.fontColor = Colors.black87,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
