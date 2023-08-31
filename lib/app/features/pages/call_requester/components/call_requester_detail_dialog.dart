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
              CustomExpandedTextField(controller: controller.solicitanteC, labelText: 'Solicitante'),
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
                child: const Text('Finalizar'),
                onPressed: () {
                },
              ),                                                
            ],
          ),
        ],
      ),
    );
  }
}
