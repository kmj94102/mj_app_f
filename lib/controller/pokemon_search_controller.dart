import 'package:get/get.dart';
import 'package:mj_app_f/model/pokemon.dart';

class PokemonSearchController extends GetxController {
  static PokemonSearchController instance = Get.find();

  final _typeList = <PokemonType>[].obs;

  List<PokemonType> get typeList => _typeList;

  final _generationList = <PokemonGeneration>[].obs;

  List<PokemonGeneration> get generationList => _generationList;

  final _isAll = true.obs;

  bool get isAll => _isAll.value;

  @override
  void onInit() {
    super.onInit();

    _typeList.value = getPokemonTypes();
    _generationList.value = getPokemonGeneration();
  }

  void updateIsAll(bool value) {
    _isAll.value = value;
  }

  void updateSelectType(int index) {
    if (index == 0) {
      for (var i = 0; i < _typeList.length; i++) {
        _typeList[i].isSelect = (i == 0);
      }
    } else {
      _typeList[index].isSelect = !_typeList[index].isSelect;

      var selectedCount = _typeList.where((t) => t.isSelect).length;
      if (selectedCount > 2) {
        _typeList[index].isSelect = false;
        Get.showSnackbar(
          GetSnackBar(
            message: '최대 2개까지 선택 가능합니다.',
            duration: const Duration(seconds: 1),
          ),
        );
      }

      _typeList[0].isSelect = !_typeList.skip(1).any((t) => t.isSelect);
    }

    _typeList.refresh();
  }

  void updateSelectGeneration(int index) {
    if (index == 0) {
      for (var i = 0; i < _generationList.length; i++) {
        _generationList[i].isSelect = (i == 0);
      }
    } else {
      _generationList[index].isSelect = !_generationList[index].isSelect;

      var exceptAll = _generationList.skip(1);

      if (exceptAll.every((t) => t.isSelect)) {
        for (var i = 0; i < _generationList.length; i++) {
          _generationList[i].isSelect = (i == 0);
        }
      } else if (exceptAll.every((t) => !t.isSelect)) {
        for (var i = 0; i < _generationList.length; i++) {
          _generationList[i].isSelect = (i == 0);
        }
      } else {
        _generationList[0].isSelect = false;
      }
    }

    _generationList.refresh();
  }

  void clear() {
    Get.log("clear");
    _isAll.value = true;
    _typeList.value = getPokemonTypes();
    _generationList.value = getPokemonGeneration();
  }

  void onSearch(String value) {
    final types = typeList
        .where((type) => type.isSelect)
        .map((type) => type.koreanName)
        .join(',');
    final generations = generationList
        .where((generation) => generation.isSelect)
        .map((generation) => generation.koreanName)
        .join(',');

    Get.back(
      result: {
        'searchValue': value,
        'isAll': _isAll.value,
        'types': types,
        'generations': generations,
      },
    );
  }
}
