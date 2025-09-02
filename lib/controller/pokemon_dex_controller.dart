import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/pokemon.dart';

class PokemonDexController extends GetxController {
  static PokemonDexController instance = Get.find();

  final _list = <PokemonInfo>[].obs;

  List<PokemonInfo> get list => _list;

  final _searchInfo =
      PokemonSearchInfo(
        name: '',
        skip: 0,
        limit: 100,
        generation: '',
        types: '',
        isCatch: true,
      ).obs;

  List<String> get searchInfo => _searchInfo.value.getSearchInfoList();

  @override
  void onInit() {
    super.onInit();

    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await http.get(
      Uri.parse(
        'https://port-0-mj-api-e9btb72blgnd5rgr.sel3.cloudtype.app/pokemon/select/list?skip='
        '${_searchInfo.value.skip}&'
        'limit=${_searchInfo.value.limit}&'
        'types=${_searchInfo.value.types}&'
        'generations=${_searchInfo.value.generation}&,'
        'name=${_searchInfo.value.name}&'
        'is_catch=${_searchInfo.value.isCatch ? 'all' : 'not all'}',
      ),
    );

    if (response.statusCode == 200) {
      final data = PokemonInfoList.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)),
      );
      _list.value = data.list!;
    } else {
      Get.log(response.body);
    }
  }

  void setSearchInfo(dynamic item) {
    Get.log('${item['searchValue']} / ${item['isAll'] == true}');
    Get.log('${item['types']} / ${item['generations']}');

    String types = item['types'] ?? '';
    String generations = item['generations'] ?? '';
    _searchInfo.value = PokemonSearchInfo(
      name: item['searchValue'] == '' ? '' : '%${item['searchValue']}%',
      skip: 0,
      limit: 100,
      generation: generations == '전체' ? '' : generations,
      types: types == '전체' ? '' : types,
      isCatch: item['isAll'] == true,
    );

    _fetchData();
  }
}
