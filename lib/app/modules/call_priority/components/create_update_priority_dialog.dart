part of call_priority;

Future<bool> createUpdatePriorityDialog(PriorityModel? priority) {
  return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
            title: Center(
                child: Text(
                    priority == null ? "Nova Prioridade" : "Editar Prioridade",
                    style: Get.theme.textTheme.titleLarge)),
            content: SizedBox(
              width: 350,
              child: createUpdateStatusForm(priority),
            ),
          )).then((value) => Get.delete<CreateUpdatePriorityController>());
}

Widget createUpdateStatusForm(PriorityModel? priority) {
  CreateUpdatePriorityController controller =
      Get.put(CreateUpdatePriorityController(priority: priority));

  return controller.isLoading.value
      ? buildLoadingIndicator()
      : SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                addVerticalSpace(5),
                TextFormField(
                  controller: controller.nomeC,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: Validatorless.required('Nome Obrigatório'),
                ),
                addVerticalSpace(10),
                TypeAheadField<int>(
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
                  itemBuilder: (context, int peso) {
                    return ListTile(
                      title: Text(peso.toString()),
                    );
                  },
                  onSuggestionSelected: (int peso) async {
                    controller.pesoC.text = peso.toString();
                  },
                ),
                addVerticalSpace(10),
                Center(
                  child: FilledButton(
                    child: controller.buttonText,
                    onPressed: () {
                      var formValid =
                          controller.formKey.currentState?.validate() ?? false;
                      if (formValid) controller.criarAtualizarStatus();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
}
