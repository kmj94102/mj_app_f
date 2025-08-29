import 'package:flutter/material.dart';
import 'package:mj_app_f/style/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = ColorStyle.darkBlue,
    this.borderColor = Colors.transparent,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
