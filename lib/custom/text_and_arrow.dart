import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/color.dart';
import '../util/constants.dart';

class TextAndArrow extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const TextAndArrow({
    super.key,
    required this.title,
    this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = TextStyle(
      color: ColorStyle.gray,
      fontSize: 12,
    );

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(title, style: defaultTextStyle.merge(textStyle)),
          SizedBox(width: 2),
          SvgPicture.asset(
            '${Constants.imageAddress}/ic_small_arrow_right.svg',
            width: 12,
            height: 12,
          ),
        ],
      ),
    );
  }
}
