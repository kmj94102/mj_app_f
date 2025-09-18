import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mj_app_f/model/account_book.dart';

import '../../style/color.dart';
import '../../util/constants.dart';

class AccountBookItem extends StatelessWidget {
  final bool isIncome;

  const AccountBookItem({super.key, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          radius: 23,
          backgroundColor:
              isIncome
                  ? ColorStyle.darkBlue.withAlpha(30)
                  : ColorStyle.red.withAlpha(30),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              isIncome ? ColorStyle.darkBlue : ColorStyle.red,
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              '${Constants.imageAddress}/ic_home.svg',
              width: 32,
              height: 32,
            ),
          ),
        ),
        SizedBox(width: 10),

        Column(
          children: [
            Text(
              'MJ앱 api 만들기',
              style: TextStyle(color: ColorStyle.white, fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              '1,000,000원',
              style: TextStyle(
                color: isIncome ? ColorStyle.darkBlue : ColorStyle.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FixedSelector extends StatelessWidget {
  final FixedItem item;
  final int selectId;
  final Function(int) onTap;

  const FixedSelector({
    super.key,
    required this.item,
    required this.selectId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { onTap(item.id ?? 0); },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorStyle.lightBlack,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: item.id == selectId ? ColorStyle.darkBlue : ColorStyle.lightBlack,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: item.isIncome == true
                      ? ColorStyle.darkBlue.withAlpha(30)
                      : ColorStyle.red.withAlpha(30),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: item.isIncome == true
                        ? ColorStyle.darkBlue
                        : ColorStyle.red,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset('${Constants.imageAddress}/ic_meal.svg', width: 40, height: 40,),
                ),
              ),
              SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.whereToUse ?? '',
                      style: TextStyle(color: ColorStyle.white, fontSize: 16),
                    ),
                    Text(
                      item.getAmountFormat(),
                      style: TextStyle(
                        color: ColorStyle.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
