import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color color;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color = AppColors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: color,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
