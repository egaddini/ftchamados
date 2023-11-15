import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chamados/app/widgets/dropdown_entity_widget/user/user_dropdown_controller.dart';

class UserDropdownPage extends GetView<UserDropdownController> {
  
  final Function(String?)? onChanged;

  const UserDropdownPage(
    this.onChanged, {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>  DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String?>(
          isExpanded: true,
          decoration: const InputDecoration(label: Text('Responsável')),
          items: state!.map((item) => DropdownMenuItem(value: item, child: Text(item, style: Get.textTheme.bodyLarge))).toList(),
          onChanged: onChanged,
        ),
      ),
      onLoading: const CircularProgressIndicator(),
    );

  }
}
