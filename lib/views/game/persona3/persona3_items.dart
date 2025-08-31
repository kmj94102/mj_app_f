import 'package:flutter/material.dart';
import 'package:mj_app_f/custom/select_chip.dart';
import 'package:mj_app_f/style/color.dart';

class Persona3ScheduleItem extends StatelessWidget {
  final List<TempPersonaSchedule> list;

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
                  '1일 수요일',
                  style: TextStyle(color: ColorStyle.white, fontSize: 12),
                ),
              ),
            ),
            SizedBox(height: 12),

            // for (int i = 0; i < list.length; i++)
            for (var item in list)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                  ),
                  SizedBox(height: 6),

                  Text(
                    item.title,
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

class TempPersonaSchedule {
  final String title;
  final String label;

  TempPersonaSchedule({required this.title, required this.label});
}

class Persona3CommunityItem extends StatelessWidget {
  const Persona3CommunityItem({super.key});

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
                    "마법사",
                    style: TextStyle(
                      color: ColorStyle.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '1 RANK',
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
  const Persona3QuestItem({super.key});

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
                  'No.29 멋을 부리고 싶어',
                  style: TextStyle(
                    color: ColorStyle.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '7월 5일 까지',
                  style: TextStyle(
                    color: Color(0xFF767676),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),

                Text(
                  'No.5 의뢰 완료 후 해금',
                  style: TextStyle(color: ColorStyle.darkBlue, fontSize: 16),
                ),
                SizedBox(height: 16),

                Text(
                  '멋 낼 만한 아이템을 가져온다\n\n클럽 에스카 페이드의 고급 상점 점원에게 10,000엔에 구매 (블랙 쿼츠가 있을 시 1만엔)',
                  style: TextStyle(color: Color(0xFFD9D9D9), fontSize: 16),
                ),
                SizedBox(height: 20),

                Text(
                  '파워 인센스1 x 5',
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
