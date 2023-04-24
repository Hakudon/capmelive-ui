import 'package:cammelive/constants/colors.dart';
import 'package:cammelive/constants/text_styles.dart';
import 'package:cammelive/utils/navigator.dart';
import 'package:cammelive/widgets/custom_button.dart';
import 'package:cammelive/widgets/title_sub_text.dart';
import 'package:flutter/material.dart';

class UploadVideoScreen extends StatelessWidget {
  const UploadVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 10,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleSubTitleText(
              context,
              title: "How this works?",
              subTitle:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
              subTitleWidth: 1,
              isMainTitle: false,
            ),
            const SizedBox(
              height: 40,
            ),
            customButton(
              "Select Video",
              onPress: () {},
              width: 165,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "/Users/SandeshShrestha/Documents/Work/Home/Project/capmelive-ui/cammelive/assets/images",
              style: subNormalStyle(
                  weight: FontWeight.w400, color: AppColor.secondaryColor),
            ),
            Expanded(child: Container()),
            RichText(
              text: TextSpan(
                text: 'By signing up, you’re agree to our ',
                style: subNormalStyle(
                        weight: FontWeight.w500, color: AppColor.fadeTextColor)
                    .copyWith(letterSpacing: 0.5),
                children: [
                  TextSpan(
                    text: 'Terms and Conditions ',
                    style: subNormalStyle(
                        weight: FontWeight.w500, color: AppColor.fadeBlueColor),
                  ),
                  const TextSpan(
                    text: 'and ',
                  ),
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: subNormalStyle(
                        weight: FontWeight.w500, color: AppColor.fadeBlueColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            customButton("Upoad",
                width: MediaQuery.of(context).size.width, onPress: () {})
          ],
        ),
      ),
    );
  }
}
