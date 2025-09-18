import 'package:flutter/material.dart';
import 'package:mj_app_f/style/color.dart';

class CustomSelectButton extends StatelessWidget {
  final String text;
  final bool isSelect;
  final VoidCallback onTap;
  final double? fontSize;
  final BorderRadiusGeometry? borderRadius;
  final Color? selectTextColor;
  final Color? selectBorderColor;
  final Color? selectBackgroundColor;
  final Color? unSelectTextColor;
  final Color? unSelectBorderColor;
  final Color? unSelectBackgroundColor;

  const CustomSelectButton({
    super.key,
    required this.text,
    required this.isSelect,
    required this.onTap,
    this.fontSize,
    this.borderRadius,
    this.selectTextColor,
    this.selectBorderColor,
    this.selectBackgroundColor,
    this.unSelectTextColor,
    this.unSelectBorderColor,
    this.unSelectBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isSelect
                ? selectBackgroundColor ?? ColorStyle.darkBlue.withAlpha(30)
                : unSelectBackgroundColor ?? ColorStyle.lightBlack,
        border: Border.all(
          color:
              isSelect
                  ? selectBorderColor ?? ColorStyle.darkBlue
                  : unSelectBorderColor ?? ColorStyle.lightBlack,
          width: 1,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 19.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color:
                  isSelect
                      ? selectTextColor ?? ColorStyle.white
                      : unSelectTextColor ?? ColorStyle.white,
              fontSize: fontSize ?? 14,
            ),
          ),
        ),
      ),
    );
  }
}
