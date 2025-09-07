import 'package:get/get.dart';

import '../database/db_helper.dart';
import '../database/persona_table.dart';

class Persona3CommunityController extends GetxController {
  static Persona3CommunityController instance = Get.find();

  final _communityList = <PersonaCommunity>[].obs;
  List<PersonaCommunity> get communityList => _communityList;

  Future<void> fetchData() async {
    final db = DBHelper.instance;
    _communityList.value = await db.getPersonaCommunityList();
    Get.log('${_communityList.length}');

    for(var item in _communityList) {
      Get.log('${item.arcana} ${item.rank}');
    }
  }
}