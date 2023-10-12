part of call_user_dashboard;

Future<void> callRequesterDetailDialog(Call call) {
  CallRequesterDetailDialogController controller =
      Get.put(CallRequesterDetailDialogController(call));

  return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
            title: AppBar(
                title: Text(call.callType!.title!),
                forceMaterialTransparency: true,
                actions: [
                  CustomDropDownButton(itens: controller.itens),
                ]),
            content: SizedBox(
              width: 1200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomExpandedTextField(
                          controller:
                              TextEditingController(text: call.callType!.title),
                          labelText: 'Titulo',
                        ),
                        addHorizontalSpace(10),
                        CustomExpandedTextField(
                          controller: TextEditingController(
                              text: call.callType!.sector!.name),
                          labelText: 'Setor',
                        ),
                        addHorizontalSpace(10),
                        CustomExpandedTextField(
                          controller: TextEditingController(
                              text: DateFormat('dd/MM/yyyy - HH:mm:ss')
                                  .format(DateTime.parse(call.dataCriacao))),
                          labelText: 'Abertura',
                        ),
                        addHorizontalSpace(10),
                        CustomExpandedTextField(
                          controller: controller.ultAtualizacaoC,
                          labelText: 'Ultima atualização',
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        Obx(() => CustomExpandedTextField(
                              controller: TextEditingController(
                                  text: controller.statusC.value),
                              labelText: 'Status',
                            )),
                        addHorizontalSpace(10),
                        CustomExpandedTextField(
                          controller: TextEditingController(
                              text: call.callType!.priority!.name),
                          labelText: 'Prioridade',
                        ),
                        addHorizontalSpace(10),
                        CustomExpandedTextField(
                          controller: controller.responsavelC,
                          labelText: 'Solucionador',
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        CustomExpandedTextField(
                          controller: controller.descSolicitC,
                          labelText: 'Descrição do solicitante',
                          maxLines: 8,
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    TextFormField(
                      controller: controller.comentarioC,
                      maxLines: 1,
                      focusNode: controller.comentar,
                      onFieldSubmitted: (value) {
                        controller.addComentario();
                        FocusScope.of(Get.context!)
                            .requestFocus(controller.comentar);
                      },
                      decoration: InputDecoration(
                        hintText: 'Adicione um comentário...',
                        suffixIcon: cInkWell(
                          25,
                          30,
                          Icons.send_outlined,
                          null,
                          Get.theme.primaryColor,
                          null,
                          'Enviar',
                          () => controller.addComentario(),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Get.theme.primaryColor)),
                        border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Get.theme.primaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Get.theme.primaryColor)),
                      ),
                    ),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.comments.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text(
                                '${controller.comments[index].user}  -  ${controller.comments[index].date}',
                                style: Get.theme.textTheme.bodySmall),
                            subtitle: Text(controller.comments[index].message),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )).then((value) => Get.delete<CallRequesterDetailDialogController>());
}
