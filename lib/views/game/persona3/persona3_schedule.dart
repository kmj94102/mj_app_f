import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/controller/perona3_schedule_controller.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/views/game/persona3/community/persona3_community.dart';
import 'package:mj_app_f/views/game/persona3/persona3_items.dart';
import 'package:mj_app_f/views/game/persona3/quest/persona3_quest.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../../../main.dart';
import '../../../util/constants.dart';

class Persona3ScheduleScreen extends StatefulWidget {
  const Persona3ScheduleScreen({super.key});

  @override
  State<Persona3ScheduleScreen> createState() => _Persona3ScheduleScreenState();
}

class _Persona3ScheduleScreenState extends State<Persona3ScheduleScreen>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Persona3ScheduleController.instance.fetchData();
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
    Persona3ScheduleController.instance.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HeaderBodyContainer(
        decoration: BoxDecoration(color: Color(0xFF00359E)),
        header: CustomGnb(
          title: '커뮤 스케줄',
          startWidget: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset('${Constants.imageAddress}/ic_back.svg'),
          ),
          endWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(Persona3CommunityScreen());
                },
                child: SvgPicture.asset(
                  '${Constants.imageAddress}/ic_star.svg',
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Get.to(Persona3QuestScreen());
                },
                child: SvgPicture.asset(
                  '${Constants.imageAddress}/ic_history.svg',
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers:
                    Persona3ScheduleController.instance.schedule.entries.map((
                      entry,
                    ) {
                      final date = entry.key;
                      final items = entry.value;

                      return SliverStickyHeader(
                        header: Container(
                          color: Color(0xFF00359E),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              date,
                              style: TextStyle(
                                color: Color(0xFF0EF2E5),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return Persona3ScheduleItem(list: items);
                          }, childCount: items.length),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
