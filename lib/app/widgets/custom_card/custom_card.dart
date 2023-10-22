import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomCard {
  static Widget customClickableCard(
      {Function? function,
      Function? onLongPress,
      Widget? content,
      double width = 300,
      double height = 100}) {
    return Card(
      elevation: 4,
      child: InkWell(
        child: SizedBox(
          width: width,
          height: height,
          child: content,
        ),
        onTap: () => function != null ? function() : null,
        onLongPress: () => onLongPress != null ? onLongPress() : null,
      ),
    );
  }

  static Widget customCard(
      {Function? function,
      Widget? content,
      required double? width,
      double? height,
      bool border = false}) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: !border
            ? null
            : BoxDecoration(
                border: Border.all(color: Get.theme.primaryColor),
                borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: width,
          height: height,
          child: content,
        ),
      ),
    );
  }
}
