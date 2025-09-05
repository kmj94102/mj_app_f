import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../model/pokemon.dart';
import '../../../../style/color.dart';
import '../../../../util/constants.dart';

Widget buildPokemonEvolution(EvolutionInfo evolution, bool isShiny) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      FadeInImage.assetNetwork(
        placeholder: '${Constants.imageAddress}/img_egg.png',
        image:
            (isShiny ? evolution.beforeShinyDot : evolution.beforeDot) ??
            Constants.eggAddress,
        width: 70,
        height: 70,
      ),
      SizedBox(width: 15),

      SvgPicture.asset('${Constants.imageAddress}/ic_next.svg'),
      SizedBox(width: 15),

      FadeInImage.assetNetwork(
        placeholder: '${Constants.imageAddress}/img_egg.png',
        image: (isShiny ? evolution.afterShinyDot : evolution.afterDot) ?? Constants.eggAddress,
        width: 70,
        height: 70,
      ),
      SizedBox(width: 15),

      Expanded(
        child: Text(
          evolution.evolutionCondition ?? '',
          style: TextStyle(color: ColorStyle.white, fontSize: 16),
        ),
      ),
    ],
  );
}

Widget buildPokemonStatus(String statuses) {
  List<String> statusList = statuses.split(',');

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
                  statusList.elementAtOrNull(0) ?? '0',
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
                  statusList.elementAtOrNull(1) ?? '0',
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
                  statusList.elementAtOrNull(2) ?? '0',
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
                  statusList.elementAtOrNull(3) ?? '0',
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
                  statusList.elementAtOrNull(4) ?? '0',
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
                  statusList.elementAtOrNull(5) ?? '0',
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

Widget buildPokemonWeakInfo(PokemonEffectGrouping group) {
  return Column(
    children: [
      if (group.superEffective.isNotEmpty)
        buildPokemonWeakItem('효과가 좋다', group.superEffective),

      if (group.normal.isNotEmpty) buildPokemonWeakItem('보통', group.normal),

      if (group.notEffective.isNotEmpty)
        buildPokemonWeakItem('효과가 별로다', group.notEffective),

      if (group.noEffect.isNotEmpty)
        buildPokemonWeakItem('효과가 없다', group.noEffect),
    ],
  );
}

Widget buildPokemonWeakItem(String title, List<PokemonType> items) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyle.white.withAlpha(30),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: ColorStyle.white, fontSize: 14),
            ),
            SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var item in items)
                  Image.asset(item.image, width: 50, height: 50),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
