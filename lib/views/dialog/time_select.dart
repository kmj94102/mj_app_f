import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mj_app_f/custom/custom_button.dart';
import 'package:mj_app_f/style/color.dart';

class TimeSelectDialog extends StatefulWidget {
  final String time;
  final Function(String) onConfirm;

  const TimeSelectDialog({super.key, required this.time, required this.onConfirm});

  @override
  State<TimeSelectDialog> createState() => _TimeSelectDialogState();
}

class _TimeSelectDialogState extends State<TimeSelectDialog> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minController;
  var hour = 0;
  var min = 0;


  @override
  void initState() {
    super.initState();
    final time = widget.time.split(':');
    hour = int.parse(time[0]);
    min = int.parse(time[1]);

    _hourController = FixedExtentScrollController(initialItem: hour);
    _minController = FixedExtentScrollController(initialItem: min);
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: ColorStyle.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '시간 선택',
              style: TextStyle(color: ColorStyle.white, fontSize: 16),
            ),
            SizedBox(height: 32),

            SizedBox(
              height: 180,
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: _hourController,
                      itemExtent: 60,
                      onSelectedItemChanged: (index) {
                        hour = index;
                      },
                      children: List.generate(
                        24,
                        (index) => Center(
                          child: Text(
                            '$index',
                            style: TextStyle(
                              color: ColorStyle.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),

                  Expanded(
                    child: CupertinoPicker(
                      scrollController: _minController,
                      itemExtent: 60,
                      onSelectedItemChanged: (index) {
                        min = index;
                      },
                      children: List.generate(
                        60,
                        (index) => Center(
                          child: Text(
                            '$index',
                            style: TextStyle(
                              color: ColorStyle.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: '취소',
                    backgroundColor: ColorStyle.lightBlack,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
                SizedBox(width: 8),

                Expanded(
                  child: CustomButton(
                    text: '확인',
                    onTap: () {
                      widget.onConfirm(
                        '${hour.toString().padLeft(2, '0')}:${min.toString().padLeft(2, '0')}',
                      );
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
