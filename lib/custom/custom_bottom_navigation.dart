import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mj_app_f/style/color.dart';

import '../util/constants.dart';

Widget buildBottomNavigation({
  required BuildContext context,
  required int selectedIndex,
  required Function(int) onTap,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: ColorStyle.lightBlack,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: bottomNavigationItem(
            iconAddress: "${Constants.imageAddress}/ic_home.svg",
            index: 0,
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
        ),
        Expanded(
          child: bottomNavigationItem(
            iconAddress: "${Constants.imageAddress}/ic_game_pad.svg",
            index: 1,
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
        ),
        Expanded(
          child: bottomNavigationItem(
            iconAddress: "${Constants.imageAddress}/ic_calendar.svg",
            index: 2,
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
        ),
        Expanded(
          child: bottomNavigationItem(
            iconAddress: "${Constants.imageAddress}/ic_flower.svg",
            index: 3,
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
        ),
        Expanded(
          child: bottomNavigationItem(
            iconAddress: "${Constants.imageAddress}/ic_other.svg",
            index: 4,
            selectedIndex: selectedIndex,
            onTap: onTap,
          ),
        ),
      ],
    ),
  );
}

Widget bottomNavigationItem({
  required String iconAddress,
  required int index,
  required int selectedIndex,
  required Function(int) onTap,
}) {
  ColorFilter colorFilter = ColorFilter.mode(
    index == selectedIndex ? ColorStyle.darkBlue : ColorStyle.black,
    BlendMode.srcIn,
  );

  return InkWell(
    onTap: () {
      onTap(index);
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 19, bottom: 19),
          child: SvgPicture.asset(
            iconAddress,
            width: 24,
            height: 24,
            colorFilter: colorFilter,
          ),
        ),
      ],
    ),
  );
}
