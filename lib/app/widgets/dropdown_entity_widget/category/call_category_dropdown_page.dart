import 'package:chamados/app/data/models/call_category_model.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/category/call_category_dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallCategoryDropdownPage extends GetView<CallCategoryDropdownController> {
  
  final RxList<CallCategoryModel> selectedItems;

  const CallCategoryDropdownPage(this.selectedItems, {super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>  DropdownButtonHideUnderline(
        child: DropdownButtonFormField<CallCategoryModel>(
          isExpanded: true,
          decoration: const InputDecoration(label: Text('Categoria')),
          hint: const Text('Select Items', style: TextStyle(fontSize: 14)),
          items: state!.map((item) {
            return DropdownMenuItem(
              value: item,
              enabled: true,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = selectedItems.contains(item);
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        if (isSelected) const Icon(Icons.check_box_outlined)
                        else const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),
                        Expanded(child: Text('${item.title} - ${item.title}', style: const TextStyle(fontSize: 14))),
                      ],
                    ),
                  );
                },
              ),
            );
          }).toList(),
          value: selectedItems.isEmpty ? null : selectedItems.last,
          selectedItemBuilder: (context) {
            return state.map(
              (item) {
                return Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    selectedItems.map((x) => x.title).toList().join(', '),
                    style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                );
              },
            ).toList();
          },
          onChanged: (value) {
            final isSelected = selectedItems.contains(value);
            isSelected ? selectedItems.remove(value) : selectedItems.add(value!);
          },
        ),
      ),
      onLoading: const CircularProgressIndicator(),
    );

  }
}