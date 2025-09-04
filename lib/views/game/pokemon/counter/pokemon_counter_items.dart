import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mj_app_f/database/pokemon_table.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/util/constants.dart';

class PokemonCounterItem extends StatelessWidget {
  final String imageUrl;
  final bool isSelect;
  final Function() onTap;

  const PokemonCounterItem({
    super.key,
    required this.imageUrl,
    required this.isSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelect ? ColorStyle.pink : ColorStyle.white.withAlpha(30),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorStyle.white, width: 1),
        ),
        child: Center(child: Image.network(imageUrl, width: 35, height: 35)),
      ),
    );
  }
}

class PokemonCounterChip extends StatelessWidget {
  final String value;
  final Function() onTap;

  const PokemonCounterChip({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: ColorStyle.white, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              value,
              style: TextStyle(color: ColorStyle.white, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildPokemonCounterHistory({
  required PokemonCounter item,
  required VoidCallback onRecovery,
  required VoidCallback onDelete,
}) {
  return Container(
    decoration: BoxDecoration(
      color: ColorStyle.white.withAlpha(30),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              onTap: onDelete,
              child: SvgPicture.asset('${Constants.imageAddress}/ic_close.svg'),
            ),
          ),
        ),
        SizedBox(height: 5),

        Image.network(item.image, width: 90, height: 90),

        Text(
          item.getFormattedCount,
          style: TextStyle(
            color: ColorStyle.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(child: SizedBox()),

        GestureDetector(
          onTap: onRecovery,
          child: Container(
            decoration: BoxDecoration(
              color: ColorStyle.white.withAlpha(50),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: Text(
                  '복구하기',
                  style: TextStyle(color: ColorStyle.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
