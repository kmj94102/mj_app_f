import 'package:get/get.dart';

import '../database/db_helper.dart';
import '../database/pokemon_table.dart';

class PokemonCounterHistoryController extends GetxController {
  static PokemonCounterHistoryController instance = Get.find();

  final _db = DBHelper.instance;

  final _list = <PokemonCounter>[].obs;
  List<PokemonCounter> get list => _list;

  Future<void> getPokemonHistoryList() async {
    _list.value = await _db.getPokemonHistoryList();
  }

  Future<void> updateIsCatch(int index) async {
    final selectItem = _list.elementAtOrNull(index);
    if(selectItem == null) return;

    await _db.updateIsCatch(selectItem.id!, false);
    getPokemonHistoryList();
  }

  Future<void> deletePokemon(int index) async {
    final selectItem = _list.elementAtOrNull(index);
    if(selectItem == null) return;

    await _db.deletePokemon(selectItem.id!);
    getPokemonHistoryList();
  }
}