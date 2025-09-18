import 'package:flutter/material.dart';

import '../style/color.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onTap;

  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.text,
    required this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: isChecked ? ColorStyle.darkBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: ColorStyle.darkBlue),
          ),
          child:
              isChecked
                  ? Icon(Icons.check, color: ColorStyle.white, size: 16)
                  : null,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: textStyle ?? TextStyle(color: Color(0xFF9EA3B2), fontSize: 14),
        ),
      ],
    );
  }
}
