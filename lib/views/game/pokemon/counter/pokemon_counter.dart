import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_button.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/util/constants.dart';
import 'package:mj_app_f/views/game/pokemon/counter/pokemon_counter_items.dart';
import 'package:mj_app_f/views/game/pokemon/dex/pokemon_dex.dart';

import 'history/pokemon_counter_history.dart';

class PokemonCounterScreen extends StatefulWidget {
  const PokemonCounterScreen({super.key});

  @override
  State<PokemonCounterScreen> createState() => _PokemonCounterScreenState();
}

class _PokemonCounterScreenState extends State<PokemonCounterScreen> {
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
                    SizedBox(width: 10,),

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
                  children: [
                    PokemonCounterItem(
                      imageUrl:
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                      isSelect: true,
                    ),
                    SizedBox(width: 12),
                    PokemonCounterItem(
                      imageUrl:
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
                      isSelect: false,
                    ),
                    SizedBox(width: 12),
                    PokemonCounterItem(
                      imageUrl:
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
                      isSelect: false,
                    ),
                    SizedBox(width: 12),
                    PokemonCounterItem(
                      imageUrl:
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
                      isSelect: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                    width: 157,
                    height: 157,
                  ),
                  Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png',
                    width: 157,
                    height: 157,
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
                      '100,000,000',
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
                    child: PokemonCounterChip(value: "- 1", onTap: () {}),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: PokemonCounterChip(value: "- 5", onTap: () {}),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: PokemonCounterChip(value: "- 1Box", onTap: () {}),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: PokemonCounterChip(value: "- 5Box", onTap: () {}),
                  ),
                ],
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: PokemonCounterChip(value: "+ 1", onTap: () {}),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: PokemonCounterChip(value: "+ 5", onTap: () {}),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: PokemonCounterChip(value: "+ 1Box", onTap: () {}),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: PokemonCounterChip(value: "+ 5Box", onTap: () {}),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),

              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: '삭제',
                      onTap: () {},
                      backgroundColor: ColorStyle.gray,
                      borderColor: ColorStyle.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      text: 'GET',
                      onTap: () {},
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
    );
  }
}
