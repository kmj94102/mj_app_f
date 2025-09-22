import 'dart:developer' as Get;
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/util/constants.dart';

import '../model/schedule.dart';

class CustomCalendar extends StatefulWidget {
  final List<ScheduleCalendarInfo?> list;
  final String selectDate;
  final String selectYearMonth;
  final Function(String) onTap;
  final VoidCallback onPrevMonth;
  final VoidCallback onNextMonth;

  const CustomCalendar({
    super.key,
    required this.list,
    required this.selectDate,
    required this.selectYearMonth,
    required this.onTap,
    required this.onPrevMonth,
    required this.onNextMonth,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyle.lightBlack,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
        child: Column(
          children: [
            // 연월
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 10,
                bottom: 10,
                right: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.selectYearMonth,
                      style: TextStyle(
                        color: ColorStyle.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: widget.onPrevMonth,
                    child: SvgPicture.asset(
                      '${Constants.imageAddress}/ic_prev.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  SizedBox(width: 12),

                  GestureDetector(
                    onTap: widget.onNextMonth,
                    child: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: SvgPicture.asset(
                        '${Constants.imageAddress}/ic_prev.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 요일
            Row(
              children: [
                Expanded(
                  child: Text(
                    '일',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    '월',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    '화',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    '수',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    '목',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    '금',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    '토',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 12),
                  ),
                ),
              ],
            ),

            // 달력
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                mainAxisExtent: 44,
              ),
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return widget.list[index] == null
                    ? Container()
                    : CustomCalendarItem(
                      item: widget.list[index]!,
                      selectDate: widget.selectDate,
                      onTap: widget.onTap,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCalendarItem extends StatelessWidget {
  final ScheduleCalendarInfo item;
  final String selectDate;
  final Function(String) onTap;

  const CustomCalendarItem({
    super.key,
    required this.item,
    required this.selectDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final listLength = math.min(item.itemList?.length ?? 0, 3);
    return GestureDetector(
      onTap: () {
        onTap(item.getDate());
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color:
                selectDate == item.getDate()
                    ? ColorStyle.darkBlue
                    : Colors.transparent,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item.getDay(),
              style: TextStyle(
                color: ColorStyle.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(listLength, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == listLength - 1 ? 0 : 5,
                    ),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: ColorStyle.darkBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
