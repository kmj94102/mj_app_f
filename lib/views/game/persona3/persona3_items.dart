import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mj_app_f/custom/select_chip.dart';
import 'package:mj_app_f/style/color.dart';

import '../../../database/persona_table.dart';
import '../../../model/persona.dart';

class Persona3ScheduleItem extends StatelessWidget {
  final PersonaSchedule schedule;
  final Function(List<int>) onTap;

  const Persona3ScheduleItem({
    super.key,
    required this.schedule,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 8,
                  ),
                  child: Text(
                    schedule.getDate(),
                    style: TextStyle(color: ColorStyle.white, fontSize: 12),
                  ),
                ),
              ),
              SizedBox(height: 12),

              for (var item in schedule.items ?? <PersonaScheduleInfo>[])
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

              GestureDetector(
                onTap: () {
                  onTap(schedule.getIdxList());
                },
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Persona3CommunityItem extends StatefulWidget {
  final List<PersonaCommunity> items;
  final int rank;
  final Function(int) updateRank;

  const Persona3CommunityItem({
    super.key,
    required this.items,
    required this.rank,
    required this.updateRank,
  });

  @override
  State<Persona3CommunityItem> createState() => _Persona3CommunityItemState();
}

class _Persona3CommunityItemState extends State<Persona3CommunityItem> {
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectIndex = max(widget.rank - 2, 0);
    });
  }

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
                    widget.items.first.arcana,
                    style: TextStyle(
                      color: ColorStyle.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${widget.rank} RANK',
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
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                  child: SelectChip(
                    text: "${index + 2} 랭크",
                    isSelect: index == selectIndex,
                    selectColor: ColorStyle.darkBlue.withAlpha(50),
                    selectBorderColor: ColorStyle.darkBlue,
                    selectTextColor: ColorStyle.white,
                    unSelectBorderColor: ColorStyle.gray,
                    unSelectTextColor: ColorStyle.gray,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
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
                      widget.items[selectIndex].contents,
                      style: TextStyle(color: ColorStyle.white, fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.updateRank(selectIndex + 2);
                    },
                    child: Container(
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

                if (item.condition.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        item.condition,
                        style: TextStyle(
                          color: ColorStyle.darkBlue,
                          fontSize: 16,
                        ),
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
