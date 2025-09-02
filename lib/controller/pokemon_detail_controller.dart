import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
}
