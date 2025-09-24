import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/controller/insert_schedule_controller.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_button.dart';

import '../../../util/constants.dart';
import '../schedule_item.dart';

class InsertScheduleScreen extends StatefulWidget {
  const InsertScheduleScreen({super.key});

  @override
  State<InsertScheduleScreen> createState() => _InsertScheduleScreenState();
}

class _InsertScheduleScreenState extends State<InsertScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HeaderBodyBottomContainer(
        header: SizedBox(
          width: double.infinity,
          height: 56,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    '${Constants.imageAddress}/ic_back.svg',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SchedulePlanSelector(
                  isSchedule: InsertScheduleController.instance.isSchedule,
                  onTap: (value) {
                    InsertScheduleController.instance.updateIsSchedule(value);
                  },
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (InsertScheduleController.instance.isSchedule)
                InsertScheduleItem(
                  item: InsertScheduleController.instance.scheduleItem,
                  updateDate: (value) {
                    InsertScheduleController.instance.updateDate(value);
                  },
                  updateStartTime: (value) {
                    InsertScheduleController.instance.updateStartTime(value);
                  },
                  updateEndTime: (value) {
                    InsertScheduleController.instance.updateEndTime(value);
                  },
                  updateRecurrenceEndDate: (value) {
                    InsertScheduleController.instance.updateRecurrenceEndDate(
                      value,
                    );
                  },
                ),

              if (!InsertScheduleController.instance.isSchedule)
                InsertPlanItem(
                  item: InsertScheduleController.instance.planItem,
                  controller: InsertScheduleController.instance.textControllers,
                  updateDate: (value) {
                    InsertScheduleController.instance.updateDate(value);
                  },
                  addTask: () {
                    InsertScheduleController.instance.addTaskItem();
                  },
                  removeTask: (index) {
                    InsertScheduleController.instance.removeTaskItem(index);
                  },
                ),
            ],
          ),
        ),
        bottom: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(text: '등록하기', onTap: () {}),
          ),
        ),
      ),
    );
  }
}
