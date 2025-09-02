import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/controller/pokemon_search_controller.dart';
import 'package:mj_app_f/custom/custom_button.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/custom/select_chip.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/util/constants.dart';

class PokemonSearchScreen extends StatefulWidget {
  const PokemonSearchScreen({super.key});

  @override
  State<PokemonSearchScreen> createState() => _PokemonSearchScreenState();
}

class _PokemonSearchScreenState extends State<PokemonSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

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
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomGnb(
                    title: '포케몬 검색',
                    startWidget: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        '${Constants.imageAddress}/ic_back.svg',
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "이름을 입력해 주세요",
                      filled: true,
                      fillColor: ColorStyle.white.withAlpha(30),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: ColorStyle.white,
                          width: 0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: ColorStyle.white,
                          width: 0,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: SvgPicture.asset(
                          '${Constants.imageAddress}/ic_search.svg',
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minHeight: 0,
                        minWidth: 0,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 16,
                      ),
                      hintStyle: TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 14,
                      ),
                    ),
                    controller: _searchController,
                    style: TextStyle(color: ColorStyle.white, fontSize: 14),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 30, bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '등록 사황',
                            style: TextStyle(
                              color: ColorStyle.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 15),

                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  PokemonSearchController.instance.updateIsAll(
                                    true,
                                  );
                                },
                                child: SelectChip(
                                  text: '전체',
                                  isSelect:
                                      PokemonSearchController.instance.isAll,
                                ),
                              ),
                              SizedBox(width: 10),

                              GestureDetector(
                                onTap: () {
                                  PokemonSearchController.instance.updateIsAll(
                                    false,
                                  );
                                },
                                child: SelectChip(
                                  text: '안 잡은 포켓몬 만',
                                  isSelect:
                                      !PokemonSearchController.instance.isAll,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),

                          Text(
                            '타입',
                            style: TextStyle(
                              color: ColorStyle.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 15),

                          Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: List.generate(
                              PokemonSearchController.instance.typeList.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  PokemonSearchController.instance
                                      .updateSelectType(index);
                                },
                                child: SelectChip(
                                  text:
                                      PokemonSearchController
                                          .instance
                                          .typeList[index]
                                          .koreanName,
                                  isSelect:
                                      PokemonSearchController
                                          .instance
                                          .typeList[index]
                                          .isSelect,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),

                          Text(
                            '세대',
                            style: TextStyle(
                              color: ColorStyle.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 15),

                          Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: List.generate(
                              PokemonSearchController
                                  .instance
                                  .generationList
                                  .length,
                              (index) => GestureDetector(
                                onTap: () {
                                  PokemonSearchController.instance
                                      .updateSelectGeneration(index);
                                },
                                child: SelectChip(
                                  text:
                                      PokemonSearchController
                                          .instance
                                          .generationList[index]
                                          .koreanName,
                                  isSelect:
                                      PokemonSearchController
                                          .instance
                                          .generationList[index]
                                          .isSelect,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: '초기화',
                            onTap: () {
                              PokemonSearchController.instance.clear();
                            },
                            backgroundColor: Color(0xFF8B8B8B),
                            borderColor: ColorStyle.white,
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: CustomButton(
                            text: '검색',
                            onTap: () {
                              PokemonSearchController.instance.onSearch(
                                _searchController.text,
                              );
                            },
                            backgroundColor: ColorStyle.pink,
                            borderColor: ColorStyle.white,
                          ),
                        ),
                      ],
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
