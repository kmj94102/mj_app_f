import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/controller/game_controller.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/style/color.dart';

import '../../util/constants.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();

    GameController.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HeaderBodyContainer(
        header: CustomGnb(
          title: '게임',
          startWidget: SvgPicture.asset(
            '${Constants.imageAddress}/ic_back.svg',
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 8,
          ),
          itemCount: GameController.instance.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: GameController.instance.list[index].onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: ColorStyle.lightBlack,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        GameController.instance.list[index].imageUrl,
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 16,
                          left: 12,
                          right: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              GameController.instance.list[index].subtitle,
                              style: TextStyle(
                                color: ColorStyle.gray,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              GameController.instance.list[index].title,
                              style: TextStyle(
                                color: ColorStyle.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
