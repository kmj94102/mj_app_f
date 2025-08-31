import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';

import '../persona3_items.dart';

class Persona3QuestScreen extends StatelessWidget {
  const Persona3QuestScreen({super.key});

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
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomGnb(
                title: '커뮤 진행도',
                startWidget: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Persona3QuestItem(),
                      SizedBox(height: 12),
                      Persona3QuestItem(),
                      SizedBox(height: 12),
                      Persona3QuestItem(),
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
