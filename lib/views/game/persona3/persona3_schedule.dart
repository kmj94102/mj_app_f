import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/views/game/persona3/community/persona3_community.dart';
import 'package:mj_app_f/views/game/persona3/persona3_items.dart';
import 'package:mj_app_f/views/game/persona3/quest/persona3_quest.dart';

import '../../../util/constants.dart';

class Persona3ScheduleScreen extends StatefulWidget {
  const Persona3ScheduleScreen({super.key});

  @override
  State<Persona3ScheduleScreen> createState() => _Persona3ScheduleScreenState();
}

class _Persona3ScheduleScreenState extends State<Persona3ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF005AA4), Color(0xFF00359E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomGnb(
                title: '커뮤 스케줄',
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Persona3ScheduleItem(
                        list: [
                          TempPersonaSchedule(
                            title: '행동 내용\n2번째줄',
                            label: '방과후',
                          ),
                          TempPersonaSchedule(title: '행동 내용', label: '밤'),
                          TempPersonaSchedule(title: '비고\n비고\n비고', label: '비고'),
                        ],
                      ),
                      SizedBox(height: 12),

                      Persona3ScheduleItem(
                        list: [
                          TempPersonaSchedule(
                            title: '2행동 내용\n2번째줄',
                            label: '2방과후',
                          ),
                          TempPersonaSchedule(title: '2행동 내용', label: '밤'),
                          TempPersonaSchedule(
                            title: '2비고\n비고\n비고',
                            label: '비고',
                          ),
                        ],
                      ),
                    ],
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
