import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/db_helper.dart';
import '../database/persona_table.dart';

class Persona3CommunityController extends GetxController {
  static Persona3CommunityController instance = Get.find();

  final _communityMap = <String, List<PersonaCommunity>>{}.obs;

  Map<String, List<PersonaCommunity>> get communityMap => _communityMap;

  final _rankMap = <String, int>{}.obs;

  Map<String, int> get rankMap => _rankMap;

  Future<void> fetchData() async {
    final db = DBHelper.instance;
    await fetchRank();
    final list = (await db.getPersonaCommunityList());
    for (var item in list) {
      _communityMap.putIfAbsent(item.arcana, () => []).add(item);
    }
  }

  Future<void> fetchRank() async {
    final prefs = await SharedPreferences.getInstance();
    final arcanaList = [
      '마법사',
      '여법황',
      '여황제',
      '황제',
      '법황',
      '연인',
      '전차',
      '정의',
      '은둔자',
      '운명',
      '힘',
      '사형수',
      '절제',
      '악마',
      '탑',
      '별',
      '달',
      '태양',
      '영겁',
      '광대',
      '사신',
      '심판',
    ];

    for (var arcana in arcanaList) {
      final rank = prefs.getInt(arcana) ?? 0;
      _rankMap.putIfAbsent(arcana, () => rank);
    }
  }

  int getRank(String key) {
    return _rankMap[key] ?? 0;
  }

  Future<void> updateRank(String arcana, int rank) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(arcana, rank);
    _rankMap[arcana] = rank;
    _rankMap.refresh();
  }
}
