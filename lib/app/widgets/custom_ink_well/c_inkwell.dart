import 'package:flutter/material.dart';

import 'package:get/get.dart';

Widget cInkWell(
    double defaultWidith,
    double? hoverWidith,
    IconData defaultIcon,
    IconData? hoverIcon,
    Color defaultColor,
    Color? hoverColor,
    String message,
    Function function
    ) {
  RxDouble dWidith = defaultWidith.obs;
  Rx<IconData> dIcon = defaultIcon.obs;
  Rx<Color> dColor = defaultColor.obs;

  return Obx(
    () => InkWell(
      borderRadius: BorderRadius.circular(90),
      onHover: (value) {
        if (hoverWidith != null) dWidith.value = value ? hoverWidith : defaultWidith;
        if (hoverIcon != null) dIcon.value = value ? hoverIcon : defaultIcon;
        if (hoverColor != null) dColor.value = value ? hoverColor : defaultColor;
      },
      onTap: () => function(),
      child: Tooltip(
          message: message,
          child: Icon(dIcon.value, size: dWidith.value, color: dColor.value)),
    ),
  );
}
