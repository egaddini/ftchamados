
import 'package:chamados/app/modules/call/dashboard/widget/detail_dialog/call_detail_dialog_controller.dart';
import 'package:chamados/app/widgets/custom_ink_well/c2_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/helper.dart';
import '../../../../../../core/utils/masks.dart';
import '../../../../../widgets/c_expanded_text_field.dart';
import '../../../../../widgets/custom_drop_down_menu_button/custom_dropdown_button.dart';

class CallDetailDialog extends StatelessWidget {

  final CallDetailDialogController controller;

  const CallDetailDialog({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>  AlertDialog(
        titlePadding: const EdgeInsets.only(top: 10),
        // contentPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 10),
        title: AppBar(
          title: Text(controller.call.callType!.title!),
          forceMaterialTransparency: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomDropDownButton(itens: controller.itens),
            ),
          ]        
        ),
        content: SizedBox(
          width: 1200,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,  
              children: [
                Row(
                  children: [
                    CustomExpandedTextField(
                      controller: TextEditingController(text: controller.call.callType!.sector!.name),
                      labelText: 'Setor',
                    ),
                    addHorizontalSpace(10),
                    CustomExpandedTextField(
                      controller: TextEditingController(text: Masks.dateTimeMask(controller.call.dataCriacao)),
                      labelText: 'Abertura',
                    ),
                    addHorizontalSpace(10),
                    CustomExpandedTextField(
                      controller: TextEditingController(text: Masks.dateTimeMask(state?.dataUltAtualizacao)),
                      labelText: 'Ultima atualização',
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Obx(() => CustomExpandedTextField(
                          controller: TextEditingController(text: controller.statusC.value),
                          labelText: 'Status',
                        )),
                    addHorizontalSpace(10),
                    CustomExpandedTextField(
                      controller: TextEditingController(text: controller.call.callType!.priority!.name),
                      labelText: 'Prioridade',
                    ),
                    addHorizontalSpace(10),
                    Expanded(
                      child: Obx(() => TextFormField(
                        controller: TextEditingController(text: controller.solver.isEmpty ?  'Não designado...' : controller.solver.value),
                        readOnly: true,
                        decoration: InputDecoration(
                          label: const Text('Responsável'),
                          hintText: 'Ainda não foi atribuido',
                          suffixIcon: controller.solver.value.isEmpty ?
                            CInkWell(defaultIcon: Icons.person_add_alt, message: 'Atribuir a mim', defaultColor: Get.theme.primaryColor, function: () =>  controller.setSolver()) :
                            CInkWell(defaultIcon: Icons.person_remove_outlined, message: 'Remover atribuição', defaultColor: Get.theme.primaryColor, function: () => controller.setSolver())
                        ),
                      ),
                    )),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    CustomExpandedTextField(
                      controller: TextEditingController(text: state!.descricao),
                      labelText: 'Descrição do solicitante',
                      maxLines: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
      onLoading: buildLoadingIndicator(),
      onEmpty: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Text('No data found'),
        ],
      ),
      onError: (error) => Text(error!),
    );
  }
}
