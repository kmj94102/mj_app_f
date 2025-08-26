import 'package:flutter/material.dart';
import 'package:mj_app_f/custom/text_and_arrow.dart';
import 'package:mj_app_f/style/color.dart';

// todo 데이터 반영 예정
Widget buildScheduleItem() {
  return Container(
    decoration: BoxDecoration(
      color: ColorStyle.lightBlack,
      borderRadius: BorderRadius.circular(32),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorStyle.darkBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 12,
                  ),
                  child: Text(
                    '08:00 ~ 12:00',
                    style: TextStyle(color: ColorStyle.white, fontSize: 12),
                  ),
                ),
              ),
              TextAndArrow(title: '일정 수정'),
            ],
          ),
          SizedBox(height: 12),

          Text(
            '8월 25일의 일정 제목',
            style: TextStyle(
              color: ColorStyle.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '이렇고 저렇고한 일정을 할 예정입니다.',
            style: TextStyle(
              color: ColorStyle.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildPlanTaskItem() {
  return Container(
    decoration: BoxDecoration(
      color: ColorStyle.lightBlack,
      borderRadius: BorderRadius.circular(32),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "계획 제목",
                style: TextStyle(
                  color: ColorStyle.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextAndArrow(title: '일정 수정'),
            ],
          ),
          SizedBox(height: 12,),

          Container(
            decoration: BoxDecoration(
              color: ColorStyle.darkBlue.withAlpha(30),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorStyle.darkBlue, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (val) {},
                        checkColor: ColorStyle.white,
                        activeColor: ColorStyle.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: WidgetStateProperty.resolveWith<Color?>((
                            states,
                            ) {
                          if (states.contains(WidgetState.selected)) {
                            return ColorStyle.darkBlue;
                          }
                          return Colors.transparent;
                        }),
                      ),
                      const Text("MJ앱 api 만들기", style: TextStyle(color: ColorStyle.white),),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (val) {},
                        checkColor: ColorStyle.white,
                        activeColor: ColorStyle.gray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: WidgetStateProperty.resolveWith<Color?>((
                            states,
                            ) {
                          if (states.contains(WidgetState.selected)) {
                            return ColorStyle.darkBlue;
                          }
                          return Colors.transparent;
                        }),
                      ),
                      const Text("MJ앱 api 만들기", style: TextStyle(color: ColorStyle.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
