import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_calendar.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/views/schedule/schedule_item.dart';

import '../../controller/schedule_controller.dart';
import '../../custom/custom_gnb.dart';
import '../../model/schedule.dart';
import '../../util/constants.dart';
import 'insert/insert_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  void initState() {
    super.initState();
    ScheduleController.instance.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HeaderBodyContainer(
        header: CustomGnb(
          title: '일정',
          startWidget: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset('${Constants.imageAddress}/ic_back.svg'),
          ),
          endWidget: GestureDetector(
            onTap: () {
              Get.to(InsertScheduleScreen());
            },
            child: SvgPicture.asset('${Constants.imageAddress}/ic_plus.svg'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomCalendar(
                list: ScheduleController.instance.list,
                selectDate: ScheduleController.instance.selectDate,
                selectYearMonth: ScheduleController.instance.selectYearMonth,
                onTap: (date) {
                  ScheduleController.instance.updateSelectDate(date);
                },
                onPrevMonth: () {
                  ScheduleController.instance.goToPreviousMonth();
                },
                onNextMonth: () {
                  ScheduleController.instance.goToNextMonth();
                },
              ),
              SizedBox(height: 32),

              Text(
                ScheduleController.instance.selectDateInfo?.getDetailDate() ??
                    '',
                style: TextStyle(
                  color: ColorStyle.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              for (var item
                  in ScheduleController.instance.selectDateInfo?.itemList ?? [])
                if (item is ScheduleInfo)
                  buildScheduleItem(item)
                else if (item is PlanInfo)
                  buildPlanTaskItem(item),
            ],
          ),
        ),
      ),
    );
  }
}
