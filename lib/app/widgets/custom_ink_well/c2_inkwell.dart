import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CInkWell extends StatelessWidget {

  final double? defaultWidith;
  final double? hoverWidith;
  final IconData defaultIcon;
  final IconData? hoverIcon;
  final Color? defaultColor;
  final Color? hoverColor;
  final String? message;
  final Function? function;

  const CInkWell({
    super.key, 
    this.defaultWidith, 
    this.hoverWidith, 
    this.defaultIcon = Icons.search_outlined, 
    this.hoverIcon, 
    this.defaultColor, 
    this.hoverColor, 
    this.message = '', 
    this.function,
  });
  
  @override
  Widget build(BuildContext context) {

    RxDouble dWidith = (defaultWidith ?? 24).obs;
    Rx<IconData> dIcon = defaultIcon.obs;
    Rx<Color> dColor = (defaultColor ?? Get.theme.iconTheme.color!).obs;
    
    return Obx(
      () => InkWell(
        borderRadius: BorderRadius.circular(90),
        onHover: (value) {
          if (hoverWidith != null) dWidith.value = value ? hoverWidith! : defaultWidith!;
          if (hoverIcon != null) dIcon.value = value ? hoverIcon! : defaultIcon;
          if (hoverColor != null) dColor.value = value ? hoverColor! : defaultColor!;
        },
        onTap: () => (function != null) ? function!() : null ,
        child: Tooltip(
          message: message,
          child: Icon(dIcon.value, size: dWidith.value, color: dColor.value)
        ),
      ),
    );
  }
}