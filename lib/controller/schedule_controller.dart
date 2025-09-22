import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/schedule.dart';

class ScheduleController extends GetxController {
  static ScheduleController get instance => Get.find();

  final _date = DateTime.now().obs;

  final _list = <ScheduleCalendarInfo?>[].obs;

  // value 빼면 오류 발생
  List<ScheduleCalendarInfo?> get list => _list.value;

  String get selectDate => _date.value.toString().substring(0, 10);

  String get selectYearMonth => '${_date.value.year}년 ${_date.value.month}월';

  ScheduleCalendarInfo? get selectDateInfo {
    return _list.firstWhereOrNull((e) => isSameDay(e?.date, _date.value));
  }

  Future<void> goToPreviousMonth() async {
    _date.value = DateTime(_date.value.year, _date.value.month - 1, 1);
    fetchData();
  }

  Future<void> goToNextMonth() async {
    _date.value = DateTime(_date.value.year, _date.value.month + 1, 1);
    fetchData();
  }

  void updateSelectDate(String date) {
    _date.value = DateTime.parse(date);
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
        'https://port-0-mj-api-e9btb72blgnd5rgr.sel3.cloudtype.app/calendar/select/month?year=${_date.value.year}&month=${_date.value.month}',
      ),
    );

    if (response.statusCode == 200) {
      _list.clear();
      final emptyCount = getEmptyDaysCount(_date.value.year, _date.value.month);

      final List<dynamic> jsonList = json.decode(response.body);
      final dataList =
          jsonList
              .map((json) => ScheduleList.fromJson(json))
              .map((e) => e.toScheduleCalendarInfo())
              .toList();
      _list.addAll(List.filled(emptyCount, null));
      _list.addAll(dataList);
      _list.refresh();
    } else {
      Get.log(response.body);
    }
  }
}
