import 'package:intl/intl.dart';

class ScheduleList {
  String? date;
  List<CalendarInfoList>? calendarInfoList;
  List<ScheduleInfoList>? scheduleInfoList;
  List<PlanInfoList>? planInfoList;

  ScheduleList({
    this.date,
    this.calendarInfoList,
    this.scheduleInfoList,
    this.planInfoList,
  });

  ScheduleList.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['calendarInfoList'] != null) {
      calendarInfoList = <CalendarInfoList>[];
      json['calendarInfoList'].forEach((v) {
        calendarInfoList!.add(CalendarInfoList.fromJson(v));
      });
    }
    if (json['scheduleInfoList'] != null) {
      scheduleInfoList = <ScheduleInfoList>[];
      json['scheduleInfoList'].forEach((v) {
        scheduleInfoList!.add(ScheduleInfoList.fromJson(v));
      });
    }
    if (json['planInfoList'] != null) {
      planInfoList = <PlanInfoList>[];
      json['planInfoList'].forEach((v) {
        planInfoList!.add(PlanInfoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (calendarInfoList != null) {
      data['calendarInfoList'] =
          calendarInfoList!.map((v) => v.toJson()).toList();
    }
    if (scheduleInfoList != null) {
      data['scheduleInfoList'] =
          scheduleInfoList!.map((v) => v.toJson()).toList();
    }
    if (planInfoList != null) {
      data['planInfoList'] = planInfoList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ScheduleCalendarInfo toScheduleCalendarInfo() {
    final isHoliday = calendarInfoList?.any((e) => e.isHoliday == true);
    final isSpecialDay = calendarInfoList?.any((e) => e.isSpecialDay == true);

    final infoList = calendarInfoList
        ?.map((e) => e.info ?? '')
        .where((e) => e.isNotEmpty);
    final dateInfo =
        infoList?.isNotEmpty == true
            ? infoList?.reduce((e, acc) => "$e, $acc")
            : '';

    final itemList = <CalendarItem>[];
    if (scheduleInfoList != null) {
      itemList.addAll(scheduleInfoList!.map((e) => e.toCalendarItem()));
    }
    if (planInfoList != null) {
      itemList.addAll(planInfoList!.map((e) => e.toCalendarItem()));
    }

    return ScheduleCalendarInfo(
      date: DateTime.parse(date!),
      isHoliday: isHoliday,
      isSpecialDay: isSpecialDay,
      dateInfo: dateInfo,
      detailDate: calendarInfoList?.firstOrNull?.calendarDate,
      itemList: itemList,
    );
  }
}

class CalendarInfoList {
  int? id;
  String? calendarDate;
  String? info;
  bool? isHoliday;
  bool? isSpecialDay;

  CalendarInfoList({
    this.id,
    this.calendarDate,
    this.info,
    this.isHoliday,
    this.isSpecialDay,
  });

  CalendarInfoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    calendarDate = json['calendarDate'];
    info = json['info'];
    isHoliday = json['isHoliday'];
    isSpecialDay = json['isSpecialDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['calendarDate'] = calendarDate;
    data['info'] = info;
    data['isHoliday'] = isHoliday;
    data['isSpecialDay'] = isSpecialDay;
    return data;
  }
}

class ScheduleInfoList {
  int? id;
  String? startTime;
  String? endTime;
  String? recurrenceType;
  String? recurrenceEndDate;
  String? scheduleContent;
  String? scheduleTitle;
  int? recurrenceId;

  ScheduleInfoList({
    this.id,
    this.startTime,
    this.endTime,
    this.recurrenceType,
    this.recurrenceEndDate,
    this.scheduleContent,
    this.scheduleTitle,
    this.recurrenceId,
  });

  ScheduleInfoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    recurrenceType = json['recurrenceType'];
    recurrenceEndDate = json['recurrenceEndDate'];
    scheduleContent = json['scheduleContent'];
    scheduleTitle = json['scheduleTitle'];
    recurrenceId = json['recurrenceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['recurrenceType'] = recurrenceType;
    data['recurrenceEndDate'] = recurrenceEndDate;
    data['scheduleContent'] = scheduleContent;
    data['scheduleTitle'] = scheduleTitle;
    data['recurrenceId'] = recurrenceId;
    return data;
  }

  CalendarItem toCalendarItem() {
    return CalendarItem.scheduleInfo(
      id: id!,
      startTime: startTime!,
      endTime: endTime!,
      recurrenceType: recurrenceType!,
      recurrenceEndDate: recurrenceEndDate,
      scheduleContent: scheduleContent!,
      scheduleTitle: scheduleTitle!,
      recurrenceId: recurrenceId,
    );
  }
}

class PlanInfoList {
  int? id;
  String? planDate;
  String? title;
  List<TaskList>? taskList;

  PlanInfoList({this.id, this.planDate, this.title, this.taskList});

  PlanInfoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planDate = json['planDate'];
    title = json['title'];
    if (json['taskList'] != null) {
      taskList = <TaskList>[];
      json['taskList'].forEach((v) {
        taskList!.add(TaskList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['planDate'] = planDate;
    data['title'] = title;
    if (taskList != null) {
      data['taskList'] = taskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  CalendarItem toCalendarItem() {
    return CalendarItem.planInfo(
      id: id!,
      title: title!,
      taskList: taskList!.map((e) => e.toTaskInfo()).toList(),
    );
  }
}

class TaskList {
  int? id;
  String? contents;
  bool? isCompleted;

  TaskList({this.id, this.contents, this.isCompleted});

  TaskList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contents = json['contents'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contents'] = contents;
    data['isCompleted'] = isCompleted;
    return data;
  }

  TaskInfo toTaskInfo() {
    return TaskInfo(id: id!, contents: contents!, isCompleted: isCompleted!);
  }
}

class ScheduleCalendarInfo {
  DateTime? date;
  bool? isHoliday;
  bool? isSpecialDay;
  String? dateInfo;
  String? detailDate;
  List<CalendarItem>? itemList;

  ScheduleCalendarInfo({
    this.date,
    this.isHoliday,
    this.isSpecialDay,
    this.dateInfo,
    this.detailDate,
    this.itemList,
  });

  String getDay() => date?.day.toString() ?? '';

  String getDate() => date?.toString().substring(0, 10) ?? '';

  DateTime getDateTime() => date ?? DateTime.now();

  String getDetailDate() {
    final dt = date ?? DateTime.now();
    final month = dt.month;
    final day = dt.day;

    final weekDays = ["일", "월", "화", "수", "목", "금", "토"];
    final weekDay = weekDays[dt.weekday % 7];

    return "$month월 $day일 $weekDay요일";
  }
}

sealed class CalendarItem {
  final String type;

  const CalendarItem(this.type);

  factory CalendarItem.scheduleInfo({
    required int id,
    required String startTime,
    required String endTime,
    required String recurrenceType,
    String? recurrenceEndDate,
    required String scheduleContent,
    required String scheduleTitle,
    int? recurrenceId,
  }) = ScheduleInfo;

  factory CalendarItem.planInfo({
    required int id,
    required String title,
    required List<TaskInfo> taskList,
  }) = PlanInfo;

  static const String schedule = "schedule";
  static const String plan = "plan";
}

class ScheduleInfo extends CalendarItem {
  final int id;
  final String startTime;
  final String endTime;
  final String recurrenceType;
  final String? recurrenceEndDate;
  final String scheduleContent;
  final String scheduleTitle;
  final int? recurrenceId;

  ScheduleInfo({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.recurrenceType,
    this.recurrenceEndDate,
    required this.scheduleContent,
    required this.scheduleTitle,
    this.recurrenceId,
  }) : super(CalendarItem.schedule);

  String getTime() =>
      "${startTime.substring(11, 16)} ~ ${endTime.substring(11, 16)}";
}

class PlanInfo extends CalendarItem {
  final int id;
  final String title;
  final List<TaskInfo> taskList;

  PlanInfo({required this.id, required this.title, required this.taskList})
    : super(CalendarItem.plan);
}

class TaskInfo {
  final int id;
  final String contents;
  final bool isCompleted;

  TaskInfo({
    required this.id,
    required this.contents,
    required this.isCompleted,
  });
}

int getEmptyDaysCount(int year, int month) {
  final firstDay = DateTime(year, month, 1);
  final weekday = firstDay.weekday;

  return weekday % 7;
}

List<DateTime?> getMonthList(int year, int month) {
  final dateFormat = DateFormat("yyyy.MM.dd");

  final firstDay = DateTime(year, month, 1);
  final lastDay = DateTime(year, month + 1, 0);

  return createCalendarList(
    dateFormat.format(firstDay),
    dateFormat.format(lastDay),
  );
}

List<DateTime?> createCalendarList(String startDate, String endDate) {
  final dateFormat = DateFormat("yyyy.MM.dd");

  DateTime? startCalendar;
  DateTime? endCalendar;

  try {
    startCalendar = dateFormat.parseStrict(startDate);
    endCalendar = dateFormat.parseStrict(endDate);
  } catch (e) {
    return [];
  }

  final dayOfWeek = startCalendar.weekday;
  final emptyDays = dayOfWeek == 7 ? 0 : dayOfWeek;

  final list = <DateTime?>[];

  for (int i = 0; i < emptyDays; i++) {
    list.add(null);
  }

  var current = startCalendar;
  while (!current.isAfter(endCalendar)) {
    list.add(current);
    current = current.add(const Duration(days: 1));
  }

  return list;
}

bool isSameDay(DateTime? cal1, DateTime? cal2) {
  if (cal1 == null || cal2 == null) return false;
  return cal1.year == cal2.year &&
      cal1.month == cal2.month &&
      cal1.day == cal2.day;
}

class InsertScheduleParam {
  String? startTime;
  String? endTime;
  String? recurrenceType;
  String? recurrenceEndDate;
  String? scheduleContent;
  String? scheduleTitle;

  InsertScheduleParam({
    this.startTime,
    this.endTime,
    this.recurrenceType,
    this.recurrenceEndDate,
    this.scheduleContent,
    this.scheduleTitle,
  });

  InsertScheduleParam.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
    recurrenceType = json['recurrenceType'];
    recurrenceEndDate = json['recurrenceEndDate'];
    scheduleContent = json['scheduleContent'];
    scheduleTitle = json['scheduleTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['recurrenceType'] = recurrenceType;
    data['recurrenceEndDate'] = recurrenceEndDate;
    data['scheduleContent'] = scheduleContent;
    data['scheduleTitle'] = scheduleTitle;
    return data;
  }
}

class InsertSchedule {
  DateTime? date;
  String? startTime;
  String? endTime;
  String? recurrenceType;
  String? recurrenceEndDate;
  String? scheduleContent;
  String? scheduleTitle;
  int? recurrenceId;

  InsertSchedule({
    this.date,
    this.startTime,
    this.endTime,
    this.recurrenceType,
    this.recurrenceEndDate,
    this.scheduleContent,
    this.scheduleTitle,
    this.recurrenceId,
  });

  String getDateFormat() {
₩    return date?.toString().substring(0, 10).replaceAll('-', '.') ?? '2025.01.01';
  }
}

class InsertPlanParam {
  String? title;
  String? planDate;
  List<TaskParam>? taskList;

  InsertPlanParam({this.title, this.planDate, this.taskList});

  InsertPlanParam.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    planDate = json['planDate'];
    if (json['taskList'] != null) {
      taskList = <TaskParam>[];
      json['taskList'].forEach((v) {
        taskList!.add(TaskParam.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['planDate'] = planDate;
    if (taskList != null) {
      data['taskList'] = taskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskParam {
  int? planId;
  String? contents;
  bool? isCompleted;

  TaskParam({this.planId, this.contents, this.isCompleted});

  TaskParam.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
    contents = json['contents'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planId'] = planId;
    data['contents'] = contents;
    data['isCompleted'] = isCompleted;
    return data;
  }
}

class InsertPlan {
  int? id;
  String? title;
  DateTime? planDate;
  List<TaskParam>? taskList;

  InsertPlan({this.id, this.title, this.planDate, this.taskList});

  String getDateFormat() {
    return planDate?.toString().substring(0, 10) ?? '';
  }
}
