import 'package:flutter/material.dart';

import '../style/color.dart';

class DialogInputFiled extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const DialogInputFiled({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorStyle.lightBlack,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            text,
            style: TextStyle(color: ColorStyle.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
