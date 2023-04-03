import 'package:flutter/material.dart';
import 'package:untitled/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    this.borderRadius,
    required this.textColor,
    required this.text,
    this.onPressed,
  });

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.0,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
