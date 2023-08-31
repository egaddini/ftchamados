part of call_user_dashboard;

Future<void> callRequesterDetailDialog(BuildContext context, Call call) {
  Get.put(CallRequesterDetailDialogController(call));
  return showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      title: null,
      content: SizedBox(
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
      padding: const EdgeInsets.all(18),
      child: Column(
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
              CustomExpandedTextField(controller: controller.statusC, labelText: 'Status'),  
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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                child: const Text('Histórico'),
                onPressed: () => controller.callHistoric(),
              ),
              const SizedBox(width: 10),
              FilledButton(
                child: const Text('Cancelar'),
                onPressed: () {
                },
              ),                                                
            ],
          ),
          addVerticalSpace(10),
          TextFormField(controller: controller.comentarioC, maxLines: 1, focusNode: controller.comentar,  
            onFieldSubmitted: (value) {
              controller.addComentario(); 
              FocusScope.of(Get.context!).requestFocus(controller.comentar);
            }, 
            decoration: InputDecoration(
              labelText: 'Adicione um comentário...',
              suffixIcon: cInkWell(25, 30, Icons.send_outlined, null, Get.theme.primaryColor, null, 'Enviar', () => controller.addComentario(),),
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
    );
  }
}
