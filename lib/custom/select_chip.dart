import 'package:flutter/material.dart';
import 'package:mj_app_f/style/color.dart';

class SelectChip extends StatelessWidget {
  final String text;
  final bool isSelect;

  const SelectChip({super.key, required this.text, required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isSelect ? ColorStyle.pink : Colors.transparent,
        border: Border.all(
          color: isSelect ? ColorStyle.white : Color(0xFFD0D0D0),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Text(
          text,
          style: TextStyle(
            color: isSelect ? ColorStyle.white : Color(0xFFD0D0D0),
            fontSize: 14
          ),
        ),
      ),
    );
  }
}
