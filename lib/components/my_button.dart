import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = Colors.teal,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.all(25),
    this.margin = const EdgeInsets.symmetric(horizontal: 25),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
