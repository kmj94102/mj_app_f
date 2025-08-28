import 'package:get/get.dart';

class PokemonSearchController extends GetxController{
  static PokemonSearchController instance = Get.find();

  final _typeList = <TempSelectItem>[].obs;
  List<TempSelectItem> get typeList => _typeList;

  final _generationList = <TempSelectItem>[].obs;
  List<TempSelectItem> get generationList => _generationList;

  @override
  void onInit() {
    super.onInit();

    _typeList.value = [
      TempSelectItem(text: '전체', isSelect: true),
      TempSelectItem(text: '노말', isSelect: false),
      TempSelectItem(text: '불꽃', isSelect: false),
      TempSelectItem(text: '물', isSelect: false),
      TempSelectItem(text: '풀', isSelect: false),
      TempSelectItem(text: '전기', isSelect: false),
      TempSelectItem(text: '얼음', isSelect: false),
      TempSelectItem(text: '격투', isSelect: false),
      TempSelectItem(text: '땅', isSelect: false),
      TempSelectItem(text: '독', isSelect: false),
      TempSelectItem(text: '비행', isSelect: false),
      TempSelectItem(text: '바위', isSelect: false),
      TempSelectItem(text: '에스퍼', isSelect: false),
      TempSelectItem(text: '벌레', isSelect: false),
      TempSelectItem(text: '고스트', isSelect: false),
      TempSelectItem(text: '드래곤', isSelect: false),
      TempSelectItem(text: '강철', isSelect: false),
      TempSelectItem(text: '악', isSelect: false),
      TempSelectItem(text: '페어리', isSelect: false),
    ];

    _generationList.value = [
      TempSelectItem(text: '전체', isSelect: true),
      TempSelectItem(text: '1세대', isSelect: false),
      TempSelectItem(text: '2세대', isSelect: false),
      TempSelectItem(text: '3세대', isSelect: false),
      TempSelectItem(text: '4세대', isSelect: false),
      TempSelectItem(text: '5세대', isSelect: false),
      TempSelectItem(text: '6세대', isSelect: false),
      TempSelectItem(text: '7세대', isSelect: false),
      TempSelectItem(text: '8세대', isSelect: false),
      TempSelectItem(text: '9세대', isSelect: false),
    ];
  }
}

class TempSelectItem {
  final String text;
  final bool isSelect;

  TempSelectItem({required this.text, required this.isSelect});
}