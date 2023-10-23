import 'package:chamados/app/modules/call_requester/detail_dialog/call_requester_detail_dialog_controller.dart';
import 'package:chamados/app/widgets/custom_drop_down_menu_button/custom_dropdown_button.dart';
import 'package:chamados/core/utils/masks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/helper.dart';
import '../../../widgets/c_expanded_text_field.dart';

class CallRequesterDetailDialog extends StatelessWidget {

  final CallRequesterDetailDialogController controller;

  const CallRequesterDetailDialog({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>  AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 10),
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
              children: [
                Row(
                  children: [
                    CustomExpandedTextField(
                      controller: TextEditingController(
                          text: controller.call.callType!.sector!.name),
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
                    CustomExpandedTextField(
                      controller: TextEditingController(text: state!.responsavel == null ?  'Não designado...' : state.responsavel!.email),
                      labelText: 'Solucionador',
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    CustomExpandedTextField(
                      controller: TextEditingController(text: state.descricao),
                      labelText: 'Descrição do solicitante',
                      maxLines: 8,
                    ),
                  ],
                ),
                // addVerticalSpace(10),
                // TextFormField(
                //   controller: controller.comentarioC,
                //   maxLines: 1,
                //   focusNode: controller.comentar,
                //   onFieldSubmitted: (value) {
                //     controller.addComentario();
                //     FocusScope.of(Get.context!).requestFocus(controller.comentar);
                //   },
                //   decoration: InputDecoration(
                //     hintText: 'Adicione um comentário...',
                //     suffixIcon: cInkWell(25, 30, Icons.send_outlined, null, Get.theme.primaryColor, null, 'Enviar', () => controller.addComentario(),),
                //     enabledBorder: UnderlineInputBorder(borderSide:BorderSide(color: Get.theme.primaryColor)),
                //     border: UnderlineInputBorder(borderSide:BorderSide(color: Get.theme.primaryColor)),
                //     focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color: Get.theme.primaryColor)),
                //   ),
                // ),
                // Obx(
                //   () => ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: controller.comments.length,
                //     itemBuilder: ((context, index) {
                //       return ListTile(
                //         title: Text(
                //             '${controller.comments[index].user}  -  ${controller.comments[index].date}',
                //             style: Get.theme.textTheme.bodySmall),
                //         subtitle: Text(controller.comments[index].message),
                //       );
                //     }),
                //   ),
                // ),
              ],
            ),
          ),
        )
      ),
      onLoading: buildLoadingIndicator(),
      onEmpty: const Text('No data found'),
      onError: (error) => Text(error!),
    );
  }
}
