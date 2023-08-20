part of call_status;

Future<bool> createUpdateStatusDialog(CallStatusModel? status) {
  return showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: Center(child: Text( status == null ? "Novo Status" : status.name, style: Get.theme.textTheme.titleLarge)),
      content: SizedBox(
        width: 350,
        child:  createUpdateStatusForm(status),
      ),
    )
  ).then((value) => Get.delete<CreateUpdateStatusController>());
}

Widget createUpdateStatusForm(CallStatusModel? status) {

  CreateUpdateStatusController controller = Get.put(CreateUpdateStatusController(status: status));

  return controller.isLoading.value ? buildLoadingIndicator() : SingleChildScrollView (
    child: Form(
      key: controller.formKey,
      child: Column(
        children: [
          addVerticalSpace(5),
          TextFormField(
            controller: controller.nomeC,
            decoration: const InputDecoration(labelText: 'Nome',),
            validator: Validatorless.required('Nome Obrigatório'), 
          ),
          addVerticalSpace(10),                        
          TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller.pesoC,
              decoration: const InputDecoration(
                labelText: 'Peso',
                suffixIcon: Icon(Icons.arrow_drop_down),                                                          
              ),
            ),
            suggestionsCallback: (pattern) {
              return controller.pesos;
            },
            itemBuilder: (context, String peso) {
              return ListTile(
                title: Text(peso),
              );
            },
            onSuggestionSelected: (String peso) async {
              controller.pesoC.text = peso;
            },
          ),
          addVerticalSpace(10),         
          TextFormField(
            controller: controller.descricaoC,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Descrição',),
            validator: Validatorless.required('Nome Obrigatório'), 
          ),
          addVerticalSpace(10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: controller.notificaC.value, 
                onChanged: (value) => controller.notificaC.value = value!,
              ),
              const Text('Notificar Usuário'),
            ],
          ),
          addVerticalSpace(10),
          Center(
            child: FilledButton(
              child: controller.buttonText,
              onPressed: () {     
                var formValid = controller.formKey.currentState?.validate() ?? false;
                if (formValid) controller.criarAtualizarStatus();
              },
            ),
          ),                   
        ],
      ),
    ),
  );
}