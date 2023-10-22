import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

import 'menu_item.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<MenuItem> itens;

  const CustomDropDownButton({
    Key? key,
    required this.itens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Icon(
          Icons.more_horiz,
          color: Get.theme.primaryColor,
          size: 30,
        ),
        items: [
          ...itens.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: Row(
                children: [
                  Icon(item.icon, color: Colors.white, size: 22),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      item.text,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
        ],
        onChanged: (value) => value!.function(),
        dropdownStyleData: DropdownStyleData(
          width: 160,
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
