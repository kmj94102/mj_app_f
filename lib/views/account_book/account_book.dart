import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/style/color.dart';
import 'package:mj_app_f/util/constants.dart';

class AccountBookScreen extends StatefulWidget {
  const AccountBookScreen({super.key});

  @override
  State<AccountBookScreen> createState() => _AccountBookScreenState();
}

class _AccountBookScreenState extends State<AccountBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomGnb(title: "가계부"),
          Container(
            decoration: BoxDecoration(
              color: ColorStyle.lightBlack,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorStyle.darkBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 13,
                      ),
                      child: Text(
                        '08.26~09.25',
                        style: TextStyle(
                          color: ColorStyle.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '수입',
                        style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                      ),
                      Expanded(
                        child: Text(
                          '1,0000,000원',
                          style: TextStyle(
                            color: ColorStyle.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '지출',
                        style: TextStyle(color: ColorStyle.gray, fontSize: 14),
                      ),
                      Expanded(
                        child: Text(
                          '1,0000,000원',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: ColorStyle.darkBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              '8월 26일',
              style: TextStyle(
                color: ColorStyle.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: ColorStyle.darkBlue.withAlpha(30),
                child: SvgPicture.asset(
                  '${Constants.imageAddress}/ic_home.svg',
                  width: 32,
                  height: 32,
                ),
              ),
              SizedBox(width: 10),

              Column(
                children: [
                  Text(
                    'MJ앱 api 만들기',
                    style: TextStyle(color: ColorStyle.white, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '1,000,000원',
                    style: TextStyle(
                      color: ColorStyle.darkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),

          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: ColorStyle.red.withAlpha(30),
                child: SvgPicture.asset(
                  '${Constants.imageAddress}/ic_home.svg',
                  width: 32,
                  height: 32,
                ),
              ),
              SizedBox(width: 10),

              Column(
                children: [
                  Text(
                    'MJ앱 api 만들기',
                    style: TextStyle(color: ColorStyle.white, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '1,000,000원',
                    style: TextStyle(
                      color: ColorStyle.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
