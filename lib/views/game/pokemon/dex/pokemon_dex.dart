import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/model/pokemon.dart';
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
      () => HeaderBodyContainer(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5DBEE1), Color(0xFF226496)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        header: CustomGnb(
          title: '전국 도감',
          startWidget: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset('${Constants.imageAddress}/ic_back.svg'),
          ),
          endWidget: GestureDetector(
            onTap: () async {
              final result = await Get.to(PokemonSearchScreen());
              PokemonDexController.instance.setSearchInfo(result);
            },
            child: SvgPicture.asset('${Constants.imageAddress}/ic_search.svg'),
          ),
        ),
        body: Column(
          children: [
            if (PokemonDexController.instance.searchInfo.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [
                    for (var item in PokemonDexController.instance.searchInfo)
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF0B8DB7),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 12,
                              ),
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: ColorStyle.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                  ],
                ),
              ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  mainAxisExtent: 113,
                ),
                itemCount: PokemonDexController.instance.list.length,
                itemBuilder: (context, index) {
                  return buildPokemonDexItem(
                    item: PokemonDexController.instance.list[index],
                    onTap: (number) {
                      Get.to(
                        PokemonDetailScreen(),
                        arguments: {'number': number},
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildPokemonDexItem({
  required PokemonInfo item,
  required Function(String index) onTap,
}) {
  return GestureDetector(
    onTap: () {
      onTap(item.number ?? '');
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
            FadeInImage.assetNetwork(
              placeholder: '${Constants.imageAddress}/img_egg.png',
              image: item.image ?? Constants.eggAddress,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              item.name ?? '',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorStyle.white, fontSize: 14),
            ),
          ],
        ),
      ),
    ),
  );
}
