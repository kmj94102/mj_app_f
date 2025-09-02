import 'package:flutter/cupertino.dart';
import 'package:mj_app_f/model/pokemon.dart';
import 'package:mj_app_f/style/color.dart';

class PokemonTypeChip extends StatelessWidget {
  final PokemonType type;

  const PokemonTypeChip({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: Row(
          children: [
            Image.asset(type.image, width: 20, height: 20),
            SizedBox(width: 4),
            Text(type.koreanName, style: TextStyle(color: ColorStyle.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
