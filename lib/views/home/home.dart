import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/controller/home_controller.dart';
import 'package:mj_app_f/custom/text_and_arrow.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/views/schedule/schedule_item.dart';

import '../game/pokemon/pokemon_home_counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    HomeController.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "8월 25일 월요일",
                    style: TextStyle(
                      color: ColorStyle.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextAndArrow(title: '일정 전체보기'),
              ],
            ),
          ),
          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                buildScheduleItem(),
                SizedBox(height: 12),

                buildPlanTaskItem()
              ],
            ),
          ),
          SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "포켓몬 카운트",
                    style: TextStyle(
                      color: ColorStyle.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextAndArrow(title: '카운트 상세보기'),
              ],
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 174,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemCount: HomeController.instance.pokemonCountList.length,
              separatorBuilder: (context, index) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                return buildPokemonHomeCounter(
                  HomeController.instance.pokemonCountList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
