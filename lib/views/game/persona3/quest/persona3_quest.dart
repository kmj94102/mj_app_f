import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/main.dart';
import 'package:mj_app_f/util/constants.dart';

import '../../../../controller/persona3_quest_controller.dart';
import '../persona3_items.dart';

class Persona3QuestScreen extends StatefulWidget {
  const Persona3QuestScreen({super.key});

  @override
  State<Persona3QuestScreen> createState() => _Persona3QuestScreenState();
}

class _Persona3QuestScreenState extends State<Persona3QuestScreen>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Persona3QuestController.instance.fetchData();
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
    super.didPopNext();
    Persona3QuestController.instance.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HeaderBodyContainer(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF005AA4), Color(0xFF00359E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        header: CustomGnb(
          title: '퀘스트',
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
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    Persona3QuestController.instance.questList.length,
                    (index) => Column(
                      children: [
                        Persona3QuestItem(
                          item: Persona3QuestController.instance.questList[index],
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
