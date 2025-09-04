import 'package:get/get.dart';

import '../database/db_helper.dart';
import '../database/pokemon_table.dart';

class PokemonCounterController extends GetxController {
  static PokemonCounterController instance = Get.find();

  final _db = DBHelper.instance;

  final _pokemonList = <PokemonCounter>[].obs;

  List<PokemonCounter> get pokemonList => _pokemonList;

  final _selectIndex = 0.obs;
  int get selectIndex => _selectIndex.value;

  Rx<PokemonCounter?> get selectItem =>
      _pokemonList.isEmpty ? Rx(null) : _pokemonList[_selectIndex.value].obs;

  Future<void> getPokemonList() async {
    _pokemonList.value = await _db.getPokemonList();
  }

  void updateSelectIndex(int index) {
    _selectIndex.value = index;
  }

  Future<void> updateCount(int value) async {
    if (selectItem.value == null || selectItem.value?.id == null) return;

    await _db.updateCount(selectItem.value!.id!, selectItem.value!.count + value);
    getPokemonList();
  }

  Future<void> updateIsCatch() async {
    if (selectItem.value == null || selectItem.value?.id == null) return;

    await _db.updateIsCatch(selectItem.value!.id!, true);
    _selectIndex.value = 0;
    getPokemonList();
  }

  Future<void> delect() async {
    if (selectItem.value == null || selectItem.value?.id == null) return;

    await _db.deletePokemon(selectItem.value!.id!);
    getPokemonList();
  }
}
