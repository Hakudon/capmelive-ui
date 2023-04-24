import 'package:cammelive/constants/assets_path.dart';
import 'package:cammelive/widgets/custom_button.dart';
import 'package:cammelive/widgets/title_sub_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleSubTitleText(context,
                      title: "Caption\nLive Video",
                      subTitle:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"),
                  const SizedBox(
                    height: 10,
                  ),
                  customButton(
                    "Try Now",
                    onPress: () {},
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  titleSubTitleText(context,
                      title: "Help Us\nTrain the AI",
                      subTitle:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"),
                  const SizedBox(
                    height: 10,
                  ),
                  customButton(
                    "Next",
                    onPress: () {},
                  ),
                ],
              ),
              Positioned(
                bottom: 5,
                right: 0,
                child: Image.asset(
                  AssetPath.backImg,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
