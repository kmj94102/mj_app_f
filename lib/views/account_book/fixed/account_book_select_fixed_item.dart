import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/base_container.dart';
import 'package:mj_app_f/custom/custom_button.dart';
import 'package:mj_app_f/custom/custom_gnb.dart';
import 'package:mj_app_f/util/constants.dart';

import '../../../controller/account_book_fixed_item_controller.dart';
import '../../../main.dart';
import '../account_book_items.dart';

class AccountBookSelectFixedItemScreen extends StatefulWidget {
  const AccountBookSelectFixedItemScreen({super.key});

  @override
  State<AccountBookSelectFixedItemScreen> createState() =>
      _AccountBookSelectFixedItemScreenState();
}

class _AccountBookSelectFixedItemScreenState
    extends State<AccountBookSelectFixedItemScreen>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    AccountBookFixedItemController.instance.fetchData();
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
    AccountBookFixedItemController.instance.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HeaderBodyBottomContainer(
        header: CustomGnb(
          title: '고정내역 선택',
          startWidget: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset('${Constants.imageAddress}/ic_back.svg'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              AccountBookFixedItemController.instance.list.length,
                  (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FixedSelector(
                      item: AccountBookFixedItemController.instance.list[index],
                      selectId: AccountBookFixedItemController.instance.selectId,
                      onTap: (id) {
                        AccountBookFixedItemController.instance.updateSelectId(id);
                      },
                  ),
                );
              },
            ),
          ),
        ),
        bottom: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(text: '선택하기', onTap: () {}),
          ),
        ),
      ),
    );
  }
}
