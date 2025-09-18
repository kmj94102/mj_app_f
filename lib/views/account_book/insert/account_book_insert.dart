import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_button.dart';
import 'package:mj_app_f/custom/custom_check_box.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/custom/custom_select_button.dart';
import 'package:mj_app_f/style/color.dart';

import '../../../util/constants.dart';
import '../fixed/account_book_select_fixed_item.dart';

class AccountBookInsertScreen extends StatefulWidget {
  const AccountBookInsertScreen({super.key});

  @override
  State<AccountBookInsertScreen> createState() =>
      _AccountBookInsertScreenState();
}

class _AccountBookInsertScreenState extends State<AccountBookInsertScreen> {
  List<String> list = [
    "식비",
    "인터넷",
    "쇼핑",
    "미용",
    "게임",
    "학습",
    "생활",
    "모임",
    "의료",
    "급여",
    "교통",
    "통신",
    "금융",
    "경조사",
    "기타",
  ];

  @override
  Widget build(BuildContext context) {
    return HeaderBodyBottomContainer(
      header: CustomGnb(
        title: '가계부',
        startWidget: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset('${Constants.imageAddress}/ic_back.svg'),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                '날짜',
                style: TextStyle(color: ColorStyle.gray, fontSize: 14),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorStyle.lightBlack,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(19),
                  child: Text(
                    '2023.05.19',
                    style: TextStyle(color: ColorStyle.white, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: CustomSelectButton(
                      text: '수입',
                      isSelect: true,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomSelectButton(
                      text: '지출',
                      isSelect: false,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                '사용 금액',
                style: TextStyle(color: ColorStyle.gray, fontSize: 14),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "사용 금액을 입력해 주세요",
                  filled: true,
                  contentPadding: EdgeInsets.all(18),
                  fillColor: ColorStyle.lightBlack,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: ColorStyle.lightBlack,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: ColorStyle.darkBlue,
                      width: 1,
                    ),
                  ),
                  hintStyle: TextStyle(color: ColorStyle.gray, fontSize: 14),
                ),
                style: TextStyle(color: ColorStyle.white, fontSize: 14),
              ),
              SizedBox(height: 20),

              Text(
                '사용 내용',
                style: TextStyle(color: ColorStyle.gray, fontSize: 14),
              ),
              SizedBox(height: 8),

              TextField(
                decoration: InputDecoration(
                  hintText: "사용 내용을 입력해 주세요",
                  filled: true,
                  contentPadding: EdgeInsets.all(18),
                  fillColor: ColorStyle.lightBlack,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: ColorStyle.lightBlack,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: ColorStyle.darkBlue,
                      width: 1,
                    ),
                  ),
                  hintStyle: TextStyle(color: ColorStyle.gray, fontSize: 14),
                ),
                style: TextStyle(color: ColorStyle.white, fontSize: 14),
              ),
              SizedBox(height: 20),

              Text(
                '사용처 선택',
                style: TextStyle(color: ColorStyle.gray, fontSize: 14),
              ),
              SizedBox(height: 8),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 88,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          color:
                              index == 0
                                  ? ColorStyle.darkBlue.withAlpha(30)
                                  : ColorStyle.lightBlack,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color:
                                index == 0
                                    ? ColorStyle.darkBlue
                                    : ColorStyle.lightBlack,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            '${Constants.imageAddress}/ic_meal.svg',
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        list[index],
                        style: TextStyle(color: ColorStyle.white, fontSize: 14),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottom: Padding(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCheckBox(
                  isChecked: true,
                  text: '고정내역에 추가',
                  onTap: () {},
                ),
                GestureDetector(
                  onTap: () { Get.to(AccountBookSelectFixedItemScreen()); },
                  child: Text(
                    '고정내역에서 찾기',
                    style: TextStyle(color: Color(0xFF9EA3B2), fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),

            SizedBox(
              width: double.infinity,
              child: CustomButton(text: '등록하기', onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
