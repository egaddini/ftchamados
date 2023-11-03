import 'package:chamados/app/data/models/sector_model.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallSectorDropdownPage extends GetView<CallSectorDropdownController> {
  
  const CallSectorDropdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>  DropdownButtonHideUnderline(
        child: DropdownButtonFormField<SectorModel>(
          isExpanded: true,
          decoration: const InputDecoration(label: Text('Status')),
          hint: const Text('Select Items', style: TextStyle(fontSize: 14)),
          items: state!.map((item) {
            return DropdownMenuItem(
              value: item,
              enabled: true,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = controller.selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      isSelected ? controller.selectedItems.remove(item) : controller.selectedItems.add(item);
                      menuSetState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          if (isSelected) const Icon(Icons.check_box_outlined)
                          else const Icon(Icons.check_box_outline_blank),
                          const SizedBox(width: 16),
                          Expanded(child: Text(item.acronym, style: const TextStyle(fontSize: 14,),),),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
          value: controller.selectedItems.isEmpty ? null : controller.selectedItems.last,
          onChanged: (value) {},
          selectedItemBuilder: (context) {
            return state.map(
              (item) {
                return Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    controller.selectedItems.join(', '),
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
        ),
      ),
      onLoading: const CircularProgressIndicator(),
    );

  }
}