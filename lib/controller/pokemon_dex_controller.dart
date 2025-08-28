import 'package:get/get.dart';

class PokemonDexController extends GetxController {
  static PokemonDexController instance = Get.find();

  final _list = <String>[].obs;
  List<String> get list => _list;

  @override
  void onInit() {
    super.onInit();
    _list.value = [
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png',
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png',
    ];
  }

}