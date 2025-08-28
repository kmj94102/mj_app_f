import 'package:get/get.dart';
import 'package:mj_app_f/util/constants.dart';

import '../views/game/pokemon/dex/pokemon_dex.dart';

class GameController extends GetxController {
  static GameController instance = Get.find();

  final _list = <GameItem>[].obs;

  List<GameItem> get list => _list;

  void init() {
    _list.value = [
      GameItem(
        title: '포켓몬 도감',
        subtitle: '포켓몬',
        imageUrl: '${Constants.imageAddress}/img_game_banner01.png',
        onTap: () {
          Get.to(() => const PokemonDexScreen());
        },
      ),
      GameItem(
        title: '포켓몬 카운터',
        subtitle: '포켓몬',
        imageUrl: '${Constants.imageAddress}/img_game_banner02.png',
      ),
      GameItem(
        title: '커뮤 스케줄 & 퀘스트',
        subtitle: '페르소나3',
        imageUrl: '${Constants.imageAddress}/img_game_banner03.png',
      ),
    ];
  }
}

class GameItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  final void Function()? onTap;

  GameItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.onTap,
  });
}
