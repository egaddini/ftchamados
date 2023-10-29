import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends StatelessWidget {
  
  final List<DropdownMenuItem> itens;
  final IconData? icon;
  final bool isFilter;

  const CustomDropDownButton({
    Key? key,
    required this.itens,
    this.icon,
    this.isFilter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Icon(
          icon ?? Icons.more_horiz,
          color: Get.theme.primaryColor,
          size: 26,
        ),
        items: itens,
        onChanged: (value) => value!.function(),
        dropdownStyleData: DropdownStyleData(
          width: isFilter ? 400 : 170,
          direction: isFilter ? DropdownDirection.left : DropdownDirection.textDirection,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Get.theme.primaryColor,
          ),
          offset: const Offset(0, 8),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(itens.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}
