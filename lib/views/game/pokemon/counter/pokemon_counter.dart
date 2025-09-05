import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/controller/pokemon_counter_controller.dart';
import 'package:mj_app_f/custom/custom_button.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/util/constants.dart';
import 'package:mj_app_f/views/game/pokemon/counter/pokemon_counter_items.dart';
import 'package:mj_app_f/views/game/pokemon/dex/pokemon_dex.dart';

import '../../../../main.dart';
import 'history/pokemon_counter_history.dart';

class PokemonCounterScreen extends StatefulWidget {
  const PokemonCounterScreen({super.key});

  @override
  State<PokemonCounterScreen> createState() => _PokemonCounterScreenState();
}

class _PokemonCounterScreenState extends State<PokemonCounterScreen> with RouteAware {
  @override
  void initState() {
    super.initState();
    PokemonCounterController.instance.getPokemonList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    PokemonCounterController.instance.getPokemonList();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5DBEE1), Color(0xFF226496)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomGnb(
                    title: '포켓몬 카운터',
                    startWidget: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        '${Constants.imageAddress}/ic_back.svg',
                      ),
                    ),
                    endWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PokemonCounterHistoryScreen());
                          },
                          child: SvgPicture.asset(
                            '${Constants.imageAddress}/ic_history.svg',
                          ),
                        ),
                        SizedBox(width: 10),

                        GestureDetector(
                          onTap: () {
                            Get.to(() => PokemonDexScreen());
                          },
                          child: SvgPicture.asset(
                            '${Constants.imageAddress}/ic_plus.svg',
                          ),
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        PokemonCounterController.instance.pokemonList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: PokemonCounterItem(
                            imageUrl:
                                PokemonCounterController
                                    .instance
                                    .pokemonList[index]
                                    .spotlight,
                            isSelect:
                                index ==
                                PokemonCounterController.instance.selectIndex,
                            onTap: () {
                              PokemonCounterController.instance
                                  .updateSelectIndex(index);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FadeInImage.assetNetwork(
                          placeholder: '${Constants.imageAddress}/img_egg.png',
                          image:
                              PokemonCounterController
                                  .instance
                                  .selectItem
                                  .value
                                  ?.image ??
                              Constants.eggAddress,
                          width: 157,
                          height: 157,
                        ),
                      ),
                      Expanded(
                        child: FadeInImage.assetNetwork(
                          placeholder: '${Constants.imageAddress}/img_egg.png',
                          image:
                              PokemonCounterController
                                  .instance
                                  .selectItem
                                  .value
                                  ?.shinyImage ??
                              Constants.eggAddress,
                          width: 157,
                          height: 157,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ColorStyle.white, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          PokemonCounterController
                                  .instance
                                  .selectItem
                                  .value
                                  ?.getFormattedCount ??
                              '0',
                          style: TextStyle(
                            color: ColorStyle.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: PokemonCounterChip(
                          value: "- 1",
                          onTap: () {
                            PokemonCounterController.instance.updateCount(-1);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: PokemonCounterChip(
                          value: "- 5",
                          onTap: () {
                            PokemonCounterController.instance.updateCount(-5);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: PokemonCounterChip(
                          value: "- 1Box",
                          onTap: () {
                            PokemonCounterController.instance.updateCount(-30);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: PokemonCounterChip(
                          value: "- 5Box",
                          onTap: () {
                            PokemonCounterController.instance.updateCount(
                              -5 * 30,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: PokemonCounterChip(
                          value: "+ 1",
                          onTap: () {
                            PokemonCounterController.instance.updateCount(1);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: PokemonCounterChip(
                          value: "+ 5",
                          onTap: () {
                            PokemonCounterController.instance.updateCount(5);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: PokemonCounterChip(
                          value: "+ 1Box",
                          onTap: () {
                            PokemonCounterController.instance.updateCount(30);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: PokemonCounterChip(
                          value: "+ 5Box",
                          onTap: () {
                            PokemonCounterController.instance.updateCount(
                              30 * 5,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),

                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: '삭제',
                          onTap: () {
                            PokemonCounterController.instance.delect();
                          },
                          backgroundColor: ColorStyle.gray,
                          borderColor: ColorStyle.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomButton(
                          text: 'GET',
                          onTap: () {
                            PokemonCounterController.instance.updateIsCatch();
                          },
                          backgroundColor: ColorStyle.pink,
                          borderColor: ColorStyle.white,
                        ),
                      ),
                    ],
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
