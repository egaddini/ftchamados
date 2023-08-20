part of call_sector;

void createUpdateSectorDialog(SectorModel? sector) {
  showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: Center(child: Text(sector == null ? "Nova Setor" : "Editar Setor", style: Get.theme.textTheme.titleLarge)),
      content: SizedBox(
        width: 350,
        child: createUpdateStatusForm(sector),
      ),
    )
  ).then((value) => Get.delete<CreateUpdateSectorController>());
}

Widget createUpdateStatusForm(SectorModel? sector) {

  CreateUpdateSectorController controller = Get.put(CreateUpdateSectorController(sector: sector));

  return controller.isLoading.value ? buildLoadingIndicator() : SingleChildScrollView (
    child: Form(
      key: controller.formKey,
      child: Column(
        children: [
          addVerticalSpace(5),
          TextFormField(
            maxLength: 3,
            controller: controller.siglaC,
            decoration: const InputDecoration(labelText: 'Sigla',),
            validator: Validatorless.required('Sigla Obrigatória'), 
          ),                     
          addVerticalSpace(10),         
          TextFormField(
            controller: controller.nomeC,
            decoration: const InputDecoration(labelText: 'Nome',),
            validator: Validatorless.required('Nome Obrigatório'), 
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