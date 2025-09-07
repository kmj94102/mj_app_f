import 'package:flutter/material.dart';
import 'package:mj_app_f/custom/select_chip.dart';
import 'package:mj_app_f/style/color.dart';

import '../../../database/persona_table.dart';
import '../../../model/persona.dart';

class Persona3ScheduleItem extends StatelessWidget {
  final List<PersonaSchedule> list;

  const Persona3ScheduleItem({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF131234),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF0036FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                child: Text(
                  '${list.first.day}일 ${list.first.dayOfWeek}',
                  style: TextStyle(color: ColorStyle.white, fontSize: 12),
                ),
              ),
            ),
            SizedBox(height: 12),

            for (var item in list)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? '',
                    style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                  ),
                  SizedBox(height: 6),

                  Text(
                    item.contents ?? '',
                    style: TextStyle(
                      color: ColorStyle.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            SizedBox(height: 14),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFF0EF2E5), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Text(
                  '완료',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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

class Persona3CommunityItem extends StatelessWidget {
  final PersonaCommunity item;
  const Persona3CommunityItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF0F1F4A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.arcana,
                    style: TextStyle(
                      color: ColorStyle.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${item.rank} RANK',
                  style: TextStyle(
                    color: ColorStyle.darkBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 44,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return SelectChip(
                  text: "${index + 2} 랭크",
                  isSelect: index == 0,
                  selectColor: ColorStyle.darkBlue.withAlpha(50),
                  selectBorderColor: ColorStyle.darkBlue,
                  selectTextColor: ColorStyle.white,
                  unSelectBorderColor: ColorStyle.gray,
                  unSelectTextColor: ColorStyle.gray,
                  padding: EdgeInsets.symmetric(vertical: 12),
                );
              },
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorStyle.darkBlue.withAlpha(10),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorStyle.darkBlue, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      '그건 비밀\n연상이 최고야',
                      style: TextStyle(color: ColorStyle.white, fontSize: 14),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorStyle.darkBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        '완료',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorStyle.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Persona3QuestItem extends StatelessWidget {
  final PersonaQuest item;
  const Persona3QuestItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0F1F4A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.deadline,
                  style: TextStyle(
                    color: Color(0xFF767676),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),

                if(item.condition.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        item.condition,
                        style: TextStyle(color: ColorStyle.darkBlue, fontSize: 16),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),

                Text(
                  item.contents,
                  style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 16),
                ),
                SizedBox(height: 20),

                Text(
                  item.reward,
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorStyle.darkBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                '완료',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorStyle.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
