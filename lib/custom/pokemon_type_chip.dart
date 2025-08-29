import 'package:flutter/cupertino.dart';
import 'package:mj_app_f/style/color.dart';

class PokemonTypeChip extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Color backgroundColor;

  const PokemonTypeChip({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 20, height: 20),
            SizedBox(width: 4),
            Text(text, style: TextStyle(color: ColorStyle.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
