import 'package:cammelive/constants/text_styles.dart';
import 'package:flutter/material.dart';

Column titleSubTitleText(
  context, {
  required String title,
  required String subTitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: headingStyle(weight: FontWeight.bold, color: Colors.black),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.50,
        child: Text(subTitle,
            style: normalStyle(weight: FontWeight.normal, color: Colors.black)),
      )
    ],
  );
}
