import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mj_app_f/database/pokemon_table.dart';

import '../database/db_helper.dart';
import '../model/pokemon.dart';

class PokemonDetailController extends GetxController {
  static PokemonDetailController instance = Get.find();

  final _info = PokemonDetailInfo().obs;
  PokemonDetailInfo get info => _info.value;

  final _isShiny = false.obs;
  bool get isShiny => _isShiny.value;

  Future<void> fetchData(String number) async {
    final response = await http.get(
      Uri.parse(
        'https://port-0-mj-api-e9btb72blgnd5rgr.sel3.cloudtype.app/pokemon/select/detail/$number',
      ),
    );

    if (response.statusCode == 200) {
      final data = PokemonDetailInfo.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)),
      );
      _info.value = data;
    } else {
      Get.log(response.body);
      Get.back();
    }
  }

  Future<void> toggleShiny() async {
    _isShiny.value = !_isShiny.value;
  }

  Future<void> insertPokemonCounter() async {
    final pokemonCounter = PokemonCounter(
        name: _info.value.name,
        image: _info.value.image,
        shinyImage: _info.value.shinyImage,
        spotlight: _info.value.spotlight,
        count: 0,
        isCatch: false,
        timestamp: DateTime.now().millisecondsSinceEpoch
    );

    final db = DBHelper.instance;
    await db.insertPokemon(pokemonCounter);
    Get.showSnackbar(
      GetSnackBar(
        message: '${_info.value.name} 등록 완료',
        duration: const Duration(seconds: 2),
      )
    );
  }
}
