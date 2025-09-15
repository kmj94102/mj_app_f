import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/controller/persona3_community_controller.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';

import '../../../../main.dart';
import '../../../../util/constants.dart';
import '../persona3_items.dart';

class Persona3CommunityScreen extends StatefulWidget {
  const Persona3CommunityScreen({super.key});

  @override
  State<Persona3CommunityScreen> createState() =>
      _Persona3CommunityScreenState();
}

class _Persona3CommunityScreenState extends State<Persona3CommunityScreen>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Persona3CommunityController.instance.fetchData();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    Persona3CommunityController.instance.fetchData();
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
          title: '커뮤 진행도',
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
                    Persona3CommunityController.instance.communityMap.length,
                    (index) {
                      final entry = Persona3CommunityController
                          .instance
                          .communityMap
                          .entries
                          .elementAt(index);
                      final items = entry.value;

                      return Column(
                        children: [
                          Persona3CommunityItem(
                            items: items,
                            rank: Persona3CommunityController.instance.getRank(
                              items.first.arcana,
                            ),
                            updateRank: (rank) {
                              Persona3CommunityController.instance.updateRank(
                                items.first.arcana,
                                rank,
                              );
                            },
                          ),
                          SizedBox(height: 12),
                        ],
                      );
                    },
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
