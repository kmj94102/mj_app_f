import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  final _pokemonCountList = <String>[].obs;
  List<String> get pokemonCountList => _pokemonCountList;

  void init() {
    _pokemonCountList.value = [
      "100,000",
      "30,000",
      "700,000"
    ];
  }
}