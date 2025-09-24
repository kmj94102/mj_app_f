import 'package:flutter/material.dart';

import '../style/color.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;

  const CustomTextFiled({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.maxLength,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        contentPadding: EdgeInsets.all(18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorStyle.lightBlack, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorStyle.darkBlue, width: 1),
        ),
        fillColor: ColorStyle.lightBlack,
        hintStyle: TextStyle(color: ColorStyle.gray, fontSize: 14),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
      ),
      controller: controller,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      onChanged: onChanged,
      style: TextStyle(color: ColorStyle.white, fontSize: 14),
    );
  }
}
