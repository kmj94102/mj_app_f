import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mj_app_f/util/constants.dart';

import '../model/persona.dart';

class Persona3ScheduleController extends GetxController {
  static Persona3ScheduleController instance = Get.find();

  final _schedule = <String, List<PersonaSchedule>>{}.obs;
  Map<String, List<PersonaSchedule>> get schedule => _schedule;

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/persona/3/select/schedule2'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"skip": 0, "limit": 100}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      final dataList =
          jsonList.map((json) => PersonaSchedule.fromJson(json)).toList();

      _schedule.clear();

      for (var item in dataList) {
        final date = item.getMonth();
        _schedule.putIfAbsent(date, () => []).add(item);
      }
      _schedule.refresh();
    } else {
      Get.log('${response.statusCode} : ${response.body}');
    }
  }

  Future<void> updateSchedule(String key, int index, List<int> idxList) async {
    if(_schedule.containsKey(key)) {
      final response = await http.post(
        Uri.parse('${Constants.baseUrl}/persona/3/update/schedule'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"idxList": idxList}),
      );

      if (response.statusCode == 200) {
        _schedule[key]?.removeAt(index);
        _schedule.refresh();
      } else {
        Get.log('${response.statusCode} : ${response.body}');
      }
    }
  }
}
