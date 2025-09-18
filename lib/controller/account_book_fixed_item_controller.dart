import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mj_app_f/model/account_book.dart';
import 'package:mj_app_f/util/constants.dart';

class AccountBookFixedItemController extends GetxController {
  static AccountBookFixedItemController instance = Get.find();

  final _list = <FixedItem>[].obs;
  List<FixedItem> get list => _list;

  final _selectId = 0.obs;
  int get selectId => _selectId.value;

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/accountBook/select/fixed'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      final dataList =
          jsonList.map((json) => FixedItem.fromJson(json)).toList();

      _list.value = dataList;
    } else {
      Get.log(response.body);
    }
  }

  void updateSelectId(int id) {
    _selectId.value = id;
  }
}
