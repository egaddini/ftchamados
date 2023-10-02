part of call_user_dashboard;

Future<void> callRequesterDetailDialog(Call call) {
    
  MenuItem edit = MenuItem(text: 'Editar', icon: Icons.edit_outlined, function: () {print('object');});
  MenuItem cancel = MenuItem(text: 'Cancelar', icon: Icons.cancel_presentation_rounded, function: () {});
  MenuItem finish = MenuItem(text: 'Finalizar', icon: Icons.check_box_outlined, function: () {});
  MenuItem historic = MenuItem(text: 'Histórico', icon: Icons.history_outlined, function: () {});
  MenuItem share = MenuItem(text: 'Compartilhar', icon: Icons.share_outlined, function: () {});

  List<MenuItem> itens = [edit, finish, cancel, share, historic];

  Get.put(CallRequesterDetailDialogController(call));
  return showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: AppBar(title: Text(call.callType!.title!), forceMaterialTransparency: true, actions: [
        CustomDropDownButton(itens: itens), 
      ]),
      content: const SizedBox(
        width: 1200 ,
        child: CallRequesterDetailForm(),
      ),
    )
  ).then((value) => Get.delete<CallRequesterDetailDialogController>());
}

class CallRequesterDetailForm extends GetView<CallRequesterDetailDialogController> {

  const CallRequesterDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomExpandedTextField(controller: controller.tituloC, labelText: 'Titulo'),
              const SizedBox(width: 10),
              CustomExpandedTextField(controller: controller.setorC, labelText: 'Setor'),
              const SizedBox(width: 10),  
              CustomExpandedTextField(controller: controller.dataAberturaC, labelText: 'Abertura'),
              const SizedBox(width: 10),
              CustomExpandedTextField(controller: controller.ultAtualizacaoC, labelText: 'Ultima atualização'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Obx(() => CustomExpandedTextField(controller: TextEditingController(text: controller.statusC.value), labelText: 'Status')),  
              const SizedBox(width: 10),
              CustomExpandedTextField(controller: controller.prioridadeC, labelText: 'Prioridade'),                              
              const SizedBox(width: 10),
              CustomExpandedTextField(controller: controller.responsavelC, labelText: 'Solucionador'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CustomExpandedTextField(controller: controller.descSolicitC, labelText: 'Descrição do solicitante', maxLines: 8),
            ],
          ),          
          addVerticalSpace(10),
          TextFormField(controller: controller.comentarioC, maxLines: 1, focusNode: controller.comentar, 
            onFieldSubmitted: (value) {
              controller.addComentario(); 
              FocusScope.of(Get.context!).requestFocus(controller.comentar);
            }, 
            decoration: InputDecoration(
              hintText: 'Adicione um comentário...',
              suffixIcon: cInkWell(25, 30, Icons.send_outlined, null, Get.theme.primaryColor, null, 'Enviar', () => controller.addComentario(),),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor)),
              border: UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Get.theme.primaryColor)),
            ),
          ),
          Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.comments.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text('${controller.comments[index].user}  -  ${controller.comments[index].date}', style: Get.theme.textTheme.bodySmall),
                subtitle: Text(controller.comments[index].message),
              );
            }),
          ),),
        ],
      ),
    );
  }
}
