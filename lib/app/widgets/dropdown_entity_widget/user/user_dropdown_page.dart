import 'package:chamados/app/data/models/user_dto.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/user/user_dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDropdownPage extends GetView<UserDropdownController> {
  
  final Rx<UserDTO?> selectedItems;

  const UserDropdownPage(this.selectedItems, {super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>  DropdownButtonHideUnderline(
        child: DropdownButtonFormField<UserDTO>(
          isExpanded: true,
          decoration: const InputDecoration(label: Text('Responsável')),
          items: state!.map((item) {
            return DropdownMenuItem(
              value: item,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  return Row(
                    children: [
                      Expanded(child: Text(item.email, style: const TextStyle(fontSize: 14))),
                    ],
                  );
                },
              ),
            );
          }).toList(),
          value: selectedItems.value,
          onChanged: (value) => selectedItems.value = value,
        ),
      ),
      onLoading: const CircularProgressIndicator(),
    );

  }
}