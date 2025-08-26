import 'package:flutter/cupertino.dart';
import 'package:mj_app_f/style/color.dart';

// todo 데이터 반영 예정
Widget buildPokemonHomeCounter(String count) {
  return Container(
    decoration: BoxDecoration(
      color: ColorStyle.lightBlack,
      borderRadius: BorderRadius.circular(32),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 25, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10171.png',
            width: 90,
            height: 90,
          ),
          SizedBox(height: 5),
          Text(count, style: TextStyle(color: ColorStyle.white, fontSize: 20)),
        ],
      ),
    ),
  );
}
