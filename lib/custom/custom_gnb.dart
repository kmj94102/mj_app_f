import 'package:flutter/material.dart';
import 'package:mj_app_f/style/color.dart';

class CustomGnb extends StatelessWidget {
  final Widget? startWidget;
  final Widget? endWidget;
  final String title;

  const CustomGnb({
    super.key,
    required this.title,
    this.startWidget,
    this.endWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: startWidget ?? Container(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: endWidget ?? Container(),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: ColorStyle.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
