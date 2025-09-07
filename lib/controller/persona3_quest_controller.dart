import 'package:get/get.dart';

import '../database/db_helper.dart';
import '../database/persona_table.dart';

class Persona3QuestController extends GetxController {
  static Persona3QuestController instance = Get.find();

  final _questList = <PersonaQuest>[].obs;
  List<PersonaQuest> get questList => _questList;

  Future<void> fetchData() async {
    final list = await DBHelper.instance.getPersonaQuestList();
    _questList.value = list;
  }
}