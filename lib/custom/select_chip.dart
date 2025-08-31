import 'package:flutter/material.dart';
import 'package:mj_app_f/style/color.dart';

class SelectChip extends StatelessWidget {
  final String text;
  final bool isSelect;
  final Color selectColor;
  final Color unSelectColor;
  final Color selectTextColor;
  final Color unSelectTextColor;
  final Color selectBorderColor;
  final Color unSelectBorderColor;
  final EdgeInsetsGeometry padding;

  const SelectChip({
    super.key,
    required this.text,
    required this.isSelect,
    this.selectColor = ColorStyle.pink,
    this.unSelectColor = Colors.transparent,
    this.selectTextColor = ColorStyle.white,
    this.unSelectTextColor = const Color(0xFFD0D0D0),
    this.selectBorderColor = ColorStyle.white,
    this.unSelectBorderColor = const Color(0xFFD0D0D0),
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 12)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isSelect ? selectColor : unSelectColor,
        border: Border.all(
          color: isSelect ? selectBorderColor : unSelectBorderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: padding,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelect ? selectTextColor : unSelectTextColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
