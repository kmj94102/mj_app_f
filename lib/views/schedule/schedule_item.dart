import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mj_app_f/custom/custom_text_filed.dart';
import 'package:mj_app_f/custom/dialog_input_filed.dart';
import 'package:mj_app_f/custom/text_and_arrow.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/util/constants.dart';
import 'package:mj_app_f/views/dialog/time_select.dart';

import '../../model/schedule.dart';
import '../dialog/date_select.dart';

Widget buildScheduleItem(ScheduleInfo info) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Container(
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
                      info.getTime(),
                      style: TextStyle(color: ColorStyle.white, fontSize: 12),
                    ),
                  ),
                ),
                TextAndArrow(title: '일정 수정'),
              ],
            ),
            SizedBox(height: 12),

            Text(
              info.scheduleTitle,
              style: TextStyle(
                color: ColorStyle.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              info.scheduleContent,
              style: TextStyle(
                color: ColorStyle.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildPlanTaskItem(PlanInfo info) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Container(
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
                  info.title,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextAndArrow(title: '계획 수정'),
              ],
            ),
            SizedBox(height: 12),

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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(info.taskList.length, (index) {
                        return Row(
                          children: [
                            Checkbox(
                              value: info.taskList[index].isCompleted,
                              onChanged: (val) {},
                              checkColor: ColorStyle.white,
                              activeColor: ColorStyle.gray,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor:
                                  WidgetStateProperty.resolveWith<Color?>((
                                    states,
                                  ) {
                                    if (states.contains(WidgetState.selected)) {
                                      return ColorStyle.darkBlue;
                                    }
                                    return Colors.transparent;
                                  }),
                            ),
                            Text(
                              info.taskList[index].contents,
                              style: TextStyle(color: ColorStyle.white),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class SchedulePlanSelector extends StatelessWidget {
  final bool isSchedule;
  final Function(bool) onTap;

  const SchedulePlanSelector({
    super.key,
    required this.isSchedule,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: ColorStyle.lightBlack,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            SchedulePlanSelectorItem(
              isSelect: isSchedule,
              text: '일정',
              onTap: () {
                onTap(true);
              },
            ),
            SizedBox(width: 4),
            SchedulePlanSelectorItem(
              isSelect: !isSchedule,
              text: '계획',
              onTap: () {
                onTap(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SchedulePlanSelectorItem extends StatelessWidget {
  final bool isSelect;
  final String text;
  final VoidCallback onTap;

  const SchedulePlanSelectorItem({
    super.key,
    required this.isSelect,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 81,
        decoration: BoxDecoration(
          color: isSelect ? ColorStyle.darkBlue : ColorStyle.lightBlack,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelect ? ColorStyle.white : ColorStyle.gray,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class InsertScheduleItem extends StatelessWidget {
  final InsertSchedule item;
  final Function(String) updateDate;
  final Function(String) updateStartTime;
  final Function(String) updateEndTime;
  final Function(String) updateRecurrenceEndDate;

  const InsertScheduleItem({
    super.key,
    required this.item,
    required this.updateDate,
    required this.updateStartTime,
    required this.updateEndTime,
    required this.updateRecurrenceEndDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DialogInputFiled(
          text: item.getDateFormat(),
          onTap: () {
            showDialog(
              context: context,
              builder:
                  (context) => DateSelectDialog(
                    date: item.getDateFormat(),
                    onConfirm: updateDate,
                  ),
            );
          },
        ),
        SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: DialogInputFiled(
                text: item.startTime ?? '00:00',
                onTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => TimeSelectDialog(
                          time: item.startTime ?? '00:00',
                          onConfirm: updateStartTime,
                        ),
                  );
                },
              ),
            ),
            SizedBox(width: 4),

            Expanded(
              child: DialogInputFiled(
                text: item.endTime ?? '',
                onTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => TimeSelectDialog(
                          time: item.endTime ?? '00:00',
                          onConfirm: updateEndTime,
                        ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        DialogInputFiled(text: item.recurrenceType ?? '', onTap: () {}),
        SizedBox(height: 16),

        DialogInputFiled(
          text: item.recurrenceEndDate ?? '',
          onTap: () {
            showDialog(
              context: context,
              builder:
                  (context) => DateSelectDialog(
                    date: item.recurrenceEndDate ?? '2025.01.01',
                    onConfirm: updateRecurrenceEndDate,
                  ),
            );
          },
        ),
        SizedBox(height: 16),

        CustomTextFiled(hintText: '일정 제목'),
        SizedBox(height: 16),

        CustomTextFiled(hintText: '일정 내용', maxLines: 10),
        SizedBox(height: 16),
      ],
    );
  }
}

class InsertPlanItem extends StatelessWidget {
  final InsertPlan item;
  final List<TextEditingController> controller;
  final Function(String) updateDate;
  final VoidCallback addTask;
  final Function(int) removeTask;

  const InsertPlanItem({
    super.key,
    required this.item,
    required this.controller,
    required this.updateDate,
    required this.addTask,
    required this.removeTask,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DialogInputFiled(text: item.getDateFormat(), onTap: () {
          showDialog(
            context: context,
            builder:
                (context) => DateSelectDialog(
              date: item.getDateFormat(),
              onConfirm: updateDate,
            ),
          );
        }),
        SizedBox(height: 16),

        CustomTextFiled(hintText: '계획 제목'),
        SizedBox(height: 16),

        for (var i = 0; i < (item.taskList?.length ?? 0); i++)
          Column(
            children: [
              CustomTextFiled(
                hintText: '계획 내용',
                controller: controller[i],
                suffixIcon: GestureDetector(
                  onTap: () {
                    removeTask(i);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        ColorStyle.gray,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset(
                        '${Constants.imageAddress}/ic_close.svg',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),

        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              addTask();
            },
            child: CircleAvatar(
              backgroundColor: ColorStyle.darkBlue,
              radius: 20,
              child: SvgPicture.asset(
                '${Constants.imageAddress}/ic_plus.svg',
                width: 28,
                height: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
