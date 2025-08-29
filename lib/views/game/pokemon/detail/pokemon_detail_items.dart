import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../style/color.dart';
import '../../../../util/constants.dart';

Widget buildPokemonEvolution() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.network(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
        width: 70,
        height: 70,
      ),
      SizedBox(width: 15),

      SvgPicture.asset('${Constants.imageAddress}/ic_next.svg'),
      SizedBox(width: 15),

      Image.network(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png',
        width: 70,
        height: 70,
      ),
      SizedBox(width: 15),

      Text('Lv.16', style: TextStyle(color: ColorStyle.white, fontSize: 16)),
    ],
  );
}

Widget buildPokemonStatus() {
  return Container(
    decoration: BoxDecoration(
      color: ColorStyle.white.withAlpha(30),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'HP',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                ),
              ),
              Expanded(
                child: Text(
                  '공격',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                ),
              ),
              Expanded(
                child: Text(
                  '방어',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                ),
              ),
              Expanded(
                child: Text(
                  '특수공격',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                ),
              ),
              Expanded(
                child: Text(
                  '특수방어',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                ),
              ),
              Expanded(
                child: Text(
                  '스피드',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '39',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '52',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '43',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '60',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '50',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '65',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildPokemonWeakInfo() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorStyle.white.withAlpha(30),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
      child: Column(
        children: [
          Text(
            '효과가 좋다',
            style: TextStyle(color: ColorStyle.white, fontSize: 14),
          ),
          SizedBox(height: 10),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Image.asset(
                '${Constants.imageAddress}/img_type_fire.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                '${Constants.imageAddress}/img_type_fire.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                '${Constants.imageAddress}/img_type_fire.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                '${Constants.imageAddress}/img_type_fire.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                '${Constants.imageAddress}/img_type_fire.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                '${Constants.imageAddress}/img_type_fire.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                '${Constants.imageAddress}/img_type_fire.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                '${Constants.imageAddress}/img_type_fire.png',
                width: 50,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
