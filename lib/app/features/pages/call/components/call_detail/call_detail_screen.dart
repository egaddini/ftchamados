// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chamados/app/features/pages/call/components/call_detail/call_detail_controller.dart';
import 'package:chamados/app/models/call.dart';

// AppBar(title: Text('Chamado - ${controller.siglaC.text} ${controller.tituloC.text}'),),

void callDetailDialog(Call call) {
  showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: const Center(child: Text('Chamado ')),
      content: SizedBox(
        width: 1200,
        child: callDetailScreen(call),
      ),
    )
  ).then((value) => Get.delete<CallDetailController>());
}

Widget callDetailScreen(Call call) {
  final CallDetailController controller = Get.put(CallDetailController(call));
  return SingleChildScrollView(
    padding: const EdgeInsets.all(8),
    child: Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [  
          Row(
            children: [
              Expanded(child: TextFormField(controller: controller.idC, decoration: const InputDecoration(labelText: 'ID',), readOnly: true)),               
              addHorizontalSpace(10),
              Expanded(child: TextFormField(controller: controller.tituloC, decoration: const InputDecoration(labelText: 'Titulo',), readOnly: true)),
              addHorizontalSpace(10),
              Expanded(child: TextFormField(controller: controller.setorC, decoration: const InputDecoration(labelText: 'Setor',), readOnly: true)),
              addHorizontalSpace(10),
              Expanded(child: TextFormField(controller: controller.prioridadeC, decoration: const InputDecoration(labelText: 'Prioridade',), readOnly: true)),                
            ],
          ),
          addVerticalSpace(10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: TextFormField(controller: controller.dataAberturaC, decoration: const InputDecoration(labelText: 'Abertura',), readOnly: true,)),
              addHorizontalSpace(10),
              Expanded(child: TextFormField(controller: controller.ultAtualizacaoC, decoration: const InputDecoration(labelText: 'Ultima atualização',), readOnly: true)),
              addHorizontalSpace(10),
              Expanded(child: TextFormField(controller: controller.solicitanteC, decoration: const InputDecoration(labelText: 'Solicitante',), readOnly: true)),
              addHorizontalSpace(10),
              Expanded(child: TextFormField(controller: controller.statusC, decoration: const InputDecoration(labelText: 'Status',), readOnly: true)),                
            ],
          ),
          addVerticalSpace(10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: TextFormField(controller: controller.responsavelC, decoration: const InputDecoration(labelText: 'Solucionador Responsável',), readOnly: true)),
              addHorizontalSpace(10),
              Expanded(child: TextFormField(controller: controller.participantesC, decoration: const InputDecoration(labelText: 'Participantes',), readOnly: true)),
            ],
          ),
          addVerticalSpace(10),
          TextFormField(controller: controller.descSolicitC, decoration: const InputDecoration(labelText: 'Descrição do solicitante',), maxLines: 4, readOnly: true),
          addVerticalSpace(10),
          TextFormField(controller: controller.comentarioC, maxLines: 1, decoration: InputDecoration(
            suffixIcon: cInkWell(25, 30, Icons.send_outlined, null, Get.theme.primaryColor, null, 'Enviar', () => controller.addComentario()),
            labelText: 'Adicione um comentário...',
            ),
          ),
          SizedBox(
            height: 160,
            child: Obx(() => ListView.builder(
              itemCount: controller.comments.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text('${controller.comments[index].user}  -  ${controller.comments[index].date}', style: Get.theme.textTheme.bodySmall),
                  subtitle: Text(controller.comments[index].message),
                );
              }),
            ),),
          ),          
        ],
      ),
    ),
  );
}



