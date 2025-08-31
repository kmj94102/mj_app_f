import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';

import '../../../../util/constants.dart';
import '../persona3_items.dart';

class Persona3CommunityScreen extends StatefulWidget {
  const Persona3CommunityScreen({super.key});

  @override
  State<Persona3CommunityScreen> createState() =>
      _Persona3CommunityScreenState();
}

class _Persona3CommunityScreenState extends State<Persona3CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF005AA4), Color(0xFF00359E)],
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
                title: '커뮤 진행도',
                startWidget: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    '${Constants.imageAddress}/ic_back.svg',
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Persona3CommunityItem(),
                      SizedBox(height: 12),
                      Persona3CommunityItem(),
                      SizedBox(height: 12),
                      Persona3CommunityItem(),
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
