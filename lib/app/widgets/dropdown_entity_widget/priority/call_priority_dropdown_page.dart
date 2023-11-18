import 'package:chamados/app/data/models/priority.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/priority/call_priority_dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallPriorityDropdownPage extends GetView<CallPriorityDropdownController> {
  
  final RxList<PriorityModel> selectedItems;

  const CallPriorityDropdownPage(this.selectedItems, {super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => DropdownButtonHideUnderline(
        child: Obx(() => DropdownButtonFormField<PriorityModel>(
          isExpanded: true,
          decoration: const InputDecoration(label: Text('Prioridades')),
          hint: const Text('Select Items', style: TextStyle(fontSize: 14)),
          items: state!.map((item) {
            return DropdownMenuItem(
              value: item,
              enabled: true,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Obx(() => 
                        Checkbox(
                          value: selectedItems.contains(item), 
                          onChanged: (value) {
                            selectedItems.contains(item) ? selectedItems.remove(item) : selectedItems.add(item);
                          } 
                        )),
                        const SizedBox(width: 16),
                        Expanded(child: Text('${item.weight} - ${item.name}', style: const TextStyle(fontSize: 14))),
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
                    selectedItems.map((x) => x.name).toList().join(', '),
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
          onChanged: (value) => selectedItems.contains(value) ? selectedItems.remove(value) : selectedItems.add(value!),
        )),
      ),
      onLoading: const CircularProgressIndicator(),
    );

  }
}