import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/controller/pokemon_counter_history_controller.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/util/constants.dart';

import '../pokemon_counter_items.dart';

class PokemonCounterHistoryScreen extends StatefulWidget {
  const PokemonCounterHistoryScreen({super.key});

  @override
  State<PokemonCounterHistoryScreen> createState() =>
      _PokemonCounterHistoryScreenState();
}

class _PokemonCounterHistoryScreenState
    extends State<PokemonCounterHistoryScreen> {
  @override
  void initState() {
    super.initState();
    PokemonCounterHistoryController.instance.getPokemonHistoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HeaderBodyContainer(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5DBEE1), Color(0xFF226496)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        header: CustomGnb(
          title: '카운터 히스토리',
          startWidget: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset('${Constants.imageAddress}/ic_back.svg'),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 205,
                ),
                itemCount: PokemonCounterHistoryController.instance.list.length,
                itemBuilder: (context, index) {
                  return buildPokemonCounterHistory(
                    item: PokemonCounterHistoryController.instance.list[index],
                    onRecovery: () {
                      PokemonCounterHistoryController.instance.updateIsCatch(
                        index,
                      );
                    },
                    onDelete: () {
                      PokemonCounterHistoryController.instance.deletePokemon(
                        index,
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
