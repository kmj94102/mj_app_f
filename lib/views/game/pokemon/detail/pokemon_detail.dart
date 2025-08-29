import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_button.dart';
import 'package:mj_app_f/custom/pokemon_type_chip.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/views/game/pokemon/detail/pokemon_detail_items.dart';

import '../../../../custom/custom_gnb.dart';
import '../../../../util/constants.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                title: '00001',
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
                  },
                  child: SvgPicture.asset(
                    '${Constants.imageAddress}/ic_shiny.svg',
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
                            child: Image.network(
                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
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
                          PokemonTypeChip(
                            text: '불꽃',
                            imageUrl:
                                '${Constants.imageAddress}/img_type_fire.png',
                            backgroundColor: Color(0xFFFF9741),
                          ),
                          SizedBox(width: 10),

                          PokemonTypeChip(
                            text: '비행',
                            imageUrl:
                                '${Constants.imageAddress}/img_type_flying.png',
                            backgroundColor: Color(0xFF89AAE3),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),

                      Text(
                        '파이리',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorStyle.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
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
                                '화염포켓몬',
                                style: TextStyle(
                                  color: ColorStyle.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '강한 상대를 찾아 하늘을 날아다닌다. 무엇이든 다 녹여버리는 고열의 불꽃을 자신보다 약한 자에게 들이대지 않는다.',
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

                      Text(
                        '진화',
                        style: TextStyle(
                          color: ColorStyle.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),

                      buildPokemonEvolution(),
                      SizedBox(height: 15),

                      buildPokemonEvolution(),
                      SizedBox(height: 15),

                      buildPokemonEvolution(),
                      SizedBox(height: 30),

                      Text(
                        '종족값',
                        style: TextStyle(
                          color: ColorStyle.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),

                      buildPokemonStatus(),
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

                      buildPokemonWeakInfo(),
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
                    onTap: () {},
                    backgroundColor: Color(0xFF8B8B8B),
                    borderColor: ColorStyle.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
