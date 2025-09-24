import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/schedule.dart';

class InsertScheduleController extends GetxController {
  static InsertScheduleController instance = Get.find();

  final _isSchedule = true.obs;
  bool get isSchedule => _isSchedule.value;

  final _scheduleItem =
      InsertSchedule(
        date: DateTime.now(),
        startTime: '00:00',
        endTime: '0:00',
        recurrenceEndDate: '2025.01.01',
        recurrenceType: 'none',
      ).obs;
  InsertSchedule get scheduleItem => _scheduleItem.value;

  final _planItem =
      InsertPlan(
        planDate: DateTime.now(),
        taskList: [TaskParam(contents: '0')],
      ).obs;
  InsertPlan get planItem => _planItem.value;

  final _textControllers = <TextEditingController>[TextEditingController()].obs;
  List<TextEditingController> get textControllers => _textControllers;

  void updateIsSchedule(bool value) {
    _isSchedule.value = value;
  }

  void addTaskItem() {
    _planItem.value.taskList?.add(TaskParam());
    _textControllers.add(TextEditingController());
    _planItem.refresh();
  }

  void removeTaskItem(int index) {
    _planItem.value.taskList?.removeAt(index);
    _textControllers.removeAt(index);
    _planItem.refresh();

    if (_planItem.value.taskList?.isEmpty == true) {
      addTaskItem();
      _textControllers.add(TextEditingController());
    }
  }

  void updateDate(String value) {
    _scheduleItem.value.date = DateTime.parse(value);
    _planItem.value.planDate = DateTime.parse(value);
    _scheduleItem.refresh();
    _planItem.refresh();

    Get.log("++++ ${_scheduleItem.value.getDateFormat()}");
  }

  void updateStartTime(String value) {
    _scheduleItem.value.startTime = value;
    _scheduleItem.refresh();
  }

  void updateEndTime(String value) {
    _scheduleItem.value.endTime = value;
    _scheduleItem.refresh();
  }

  void updateRecurrenceEndDate(String value) {
    _scheduleItem.value.recurrenceEndDate = value;
    _scheduleItem.refresh();
  }
}
