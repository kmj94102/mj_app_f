import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/util/constants.dart';
import 'package:mj_app_f/views/game/pokemon/detail/pokemon_detail.dart';
import 'package:mj_app_f/views/game/pokemon/search/pokemon_search.dart';

import '../../../../controller/pokemon_dex_controller.dart';

class PokemonDexScreen extends StatefulWidget {
  const PokemonDexScreen({super.key});

  @override
  State<PokemonDexScreen> createState() => _PokemonDexScreenState();
}

class _PokemonDexScreenState extends State<PokemonDexScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5DBEE1), Color(0xFF226496)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                CustomGnb(
                  title: '전국 도감',
                  startWidget: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      '${Constants.imageAddress}/ic_back.svg',
                    ),
                  ),
                  endWidget: GestureDetector(
                    onTap: () {
                      Get.to(PokemonSearchScreen());
                    },
                    child: SvgPicture.asset(
                      '${Constants.imageAddress}/ic_search.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          mainAxisExtent: 112,
                        ),
                    itemCount: PokemonDexController.instance.list.length,
                    itemBuilder: (context, index) {
                      return buildPokemonDexItem(
                        imageUrl: PokemonDexController.instance.list[index],
                        onTap: (_) {
                          Get.to(PokemonDetailScreen());
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildPokemonDexItem({
  required String imageUrl,
  required Function(String index) onTap,
}) {
  return GestureDetector(
    onTap: () {
      onTap('');
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(30),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl, width: 60, height: 60),
            SizedBox(height: 10),
            Text(
              '이상해씨',
              style: TextStyle(color: ColorStyle.white, fontSize: 14),
            ),
          ],
        ),
      ),
    ),
  );
}
