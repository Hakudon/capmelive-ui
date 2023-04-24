import 'package:cammelive/constants/colors.dart';
import 'package:cammelive/constants/text_styles.dart';
import 'package:cammelive/utils/navigator.dart';
import 'package:cammelive/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LiveCaptionScreen extends StatelessWidget {
  const LiveCaptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isStop = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => navigateBack(context: context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 40),
        child: Column(children: [
          Container(
            height: 400,
            color: AppColor.boxColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.boxColor,
            ),
            child: Text(
              "fadeBlueColor asf lasdf lkj falhsd fds lkfj sdflkj slkdf lj",
              style: normalStyle(
                  weight: FontWeight.w500, color: AppColor.secondaryColor),
            ),
          ),
          Expanded(child: Container()),
          customButton(
            isStop ? "Stop" : "Start",
            width: MediaQuery.of(context).size.width,
            onPress: () {},
          )
        ]),
      ),
    );
  }
}
