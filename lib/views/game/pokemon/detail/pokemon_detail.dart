import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_button.dart';
import 'package:mj_app_f/custom/pokemon_type_chip.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/views/game/pokemon/detail/pokemon_detail_items.dart';

import '../../../../controller/pokemon_detail_controller.dart';
import '../../../../custom/custom_gnb.dart';
import '../../../../util/constants.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  void initState() {
    super.initState();
    PokemonDetailController.instance.fetchData(Get.arguments['number']);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
                  PokemonDetailController.instance.info.isCatch
                      ? [Color(0xFF5DBEE1), Color(0xFF226496)]
                      : [Color(0xFFA2A2A2), Color(0xFF767676)],
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
                    title: PokemonDetailController.instance.info.number,
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
                        PokemonDetailController.instance.toggleShiny();
                      },
                      child: SvgPicture.asset(
                        '${Constants.imageAddress}/ic_shiny.svg',
                        colorFilter: ColorFilter.mode(
                          PokemonDetailController.instance.isShiny
                              ? ColorStyle.pink
                              : ColorStyle.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                '${Constants.imageAddress}/ic_big_back.svg',
                              ),
                              Expanded(
                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      '${Constants.imageAddress}/img_egg.png',
                                  image:
                                      PokemonDetailController.instance.isShiny
                                          ? PokemonDetailController
                                              .instance
                                              .info
                                              .shinyImage
                                          : PokemonDetailController
                                              .instance
                                              .info
                                              .image,
                                  height: 167,
                                ),
                              ),
                              SvgPicture.asset(
                                '${Constants.imageAddress}/ic_big_next.svg',
                              ),
                            ],
                          ),
                          SizedBox(height: 25),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PokemonDetailController.instance.info.firstType !=
                                      null
                                  ? PokemonTypeChip(
                                    type:
                                        PokemonDetailController
                                            .instance
                                            .info
                                            .firstType!,
                                  )
                                  : SizedBox(),

                              PokemonDetailController
                                          .instance
                                          .info
                                          .secondType !=
                                      null
                                  ? Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: PokemonTypeChip(
                                      type:
                                          PokemonDetailController
                                              .instance
                                              .info
                                              .secondType!,
                                    ),
                                  )
                                  : SizedBox(),
                            ],
                          ),
                          SizedBox(height: 15),

                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              PokemonDetailController.instance.info.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorStyle.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),

                          Container(
                            decoration: BoxDecoration(
                              color: ColorStyle.white.withAlpha(30),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    PokemonDetailController
                                        .instance
                                        .info
                                        .classification,
                                    style: TextStyle(
                                      color: ColorStyle.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    PokemonDetailController
                                        .instance
                                        .info
                                        .description,
                                    style: TextStyle(
                                      color: ColorStyle.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30),

                          if (PokemonDetailController.instance.info.isEvolution)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '진화',
                                  style: TextStyle(
                                    color: ColorStyle.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),

                                for (var evolution
                                    in PokemonDetailController
                                        .instance
                                        .info
                                        .evolutionList)
                                  Column(
                                    children: [
                                      buildPokemonEvolution(
                                        evolution,
                                        PokemonDetailController
                                            .instance
                                            .isShiny,
                                      ),
                                      SizedBox(height: 15),
                                    ],
                                  ),
                                SizedBox(height: 15),
                              ],
                            ),

                          Text(
                            '종족값',
                            style: TextStyle(
                              color: ColorStyle.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),

                          buildPokemonStatus(
                            PokemonDetailController.instance.info.status,
                          ),
                          SizedBox(height: 30),

                          Text(
                            '타입 방어 상성',
                            style: TextStyle(
                              color: ColorStyle.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),

                          buildPokemonWeakInfo(
                            PokemonDetailController
                                .instance
                                .info
                                .effectGrouping,
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: '카운터 등록',
                        onTap: () {
                          PokemonDetailController.instance
                              .insertPokemonCounter();
                        },
                        backgroundColor: Color(0xFF8B8B8B),
                        borderColor: ColorStyle.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
