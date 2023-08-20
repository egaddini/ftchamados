part of call_category;

void createUpdateCategoryDialog(CallCategoryModel? category) {
  showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: Center(child: Text(category == null ? "Nova Prioridade" : "Editar Prioridade", style: Get.theme.textTheme.titleLarge)),
      content: SizedBox(
        width: 350,
        child: createUpdateStatusForm(category),
      ),
    )
  ).then((value) => Get.delete<CreateUpdateCategoryController>());
}

Widget createUpdateStatusForm(CallCategoryModel? category) {

  CreateUpdateCategoryController controller = Get.put(CreateUpdateCategoryController(category: category));

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
              return [];
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