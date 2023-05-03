import 'dart:convert';

import 'package:cammelive/constants/assets_path.dart';
import 'package:cammelive/provider/upload_video_provider.dart';
import 'package:cammelive/screens/live_caption.dart';
import 'package:cammelive/screens/upload_video.dart';
import 'package:cammelive/utils/navigator.dart';
import 'package:cammelive/widgets/custom_button.dart';
import 'package:cammelive/widgets/title_sub_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../constants/colors.dart';
import "../globals.dart" as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.abc_rounded),
            onPressed: () {
              const List<String> list = ["git", "pulchowk"];
              String dropdownValue = list.last;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text(""),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        child: const Text("submit"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop();

                          print(dropdownValue);
                          print(globals.SERVER_URL);

                          // send request to  backend
                          var headers = {
                            'Content-Type': 'application/json',
                          };
                          var request = http.Request(
                            'POST',
                            Uri.parse(
                                '${globals.SERVER_URL}/change_model'), // CHANGE URL HERE TO LOCAL SERVER
                          );
                          request.body = json.encode(
                            {
                              "model": dropdownValue

                              // "video_transform": transformType,
                            },
                          );
                          request.headers.addAll(headers);

                          http.StreamedResponse response = await request.send();
                          // your code
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        titleSubTitleText(context,
                            title: "Caption\nLive Video",
                            subTitle:
                                "Hey, dont worry! If you wanna know whats happening around you, just click on try now below.",
                            subTitleWidth: 0.7),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customButton(
                      "Try Now",
                      onPress: () => navigateTo(
                        context: context,
                        screen: const P2PVideo(),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    titleSubTitleText(
                      context,
                      title: "Help Us\nTrain the AI",
                      subTitle:
                          "Help us grow, upload some videos with their corresponding captions to train our model and achieve result with higher accuracy.",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customButton("Next",
                        onPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const UploadVideoScreen()),
                            ).then((value) => Provider.of<UploadVideoProvider>(
                                    context,
                                    listen: false)
                                .fileNameList = [])),
                  ],
                ),
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
