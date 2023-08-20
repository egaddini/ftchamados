part of call_category;

void createUpdateCategoryDialog(CallCategoryModel? category) {
  showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: Center(child: Text(category == null ? "Nova Categoria" : "Editar Categoria", style: Get.theme.textTheme.titleLarge)),
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
            controller: controller.tituloC,
            decoration: const InputDecoration(labelText: 'Titulo',),
            validator: Validatorless.required('Nome Obrigatório'), 
          ),                     
          addVerticalSpace(10),         
          TypeAheadField<SectorModel>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller.setorC,
              decoration: const InputDecoration(
                labelText: 'Setor',
                suffixIcon: Icon(Icons.arrow_drop_down),                                                          
              ),
            ),
            suggestionsCallback: (pattern) {
              return controller.sectors;
            },
            itemBuilder: (context, SectorModel sector) {
              return ListTile(
                title: Text('${sector.sigla} - ${sector.nome}'),
              );
            },
            onSuggestionSelected: (SectorModel sector) async {
              controller.setorC.text = '${sector.sigla} - ${sector.nome}';
              controller.category!.sector = sector;
            },
          ),
          addVerticalSpace(10),           
          TypeAheadField<PriorityModel>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller.prioridadeC,
              decoration: const InputDecoration(
                labelText: 'Prioridade',
                suffixIcon: Icon(Icons.arrow_drop_down),                                                          
              ),
            ),
            suggestionsCallback: (pattern) {
              return controller.priorities;
            },
            itemBuilder: (context, PriorityModel priority) {
              return ListTile(
                title: Text('${priority.nome} - ${priority.weight}'),
              );
            },
            onSuggestionSelected: (PriorityModel priority) async {
              controller.prioridadeC.text = '${priority.nome} - ${priority.weight}';
              controller.category!.prioridade = priority;
            },
          ),
          addVerticalSpace(10),      
          TextFormField(
            maxLines: 3,
            controller: controller.descricaoC,
            decoration: const InputDecoration(labelText: 'Descrição',),
            validator: Validatorless.required('Nome Obrigatório'), 
          ),                  
          addVerticalSpace(10),
          Center(
            child: FilledButton(
              child: controller.buttonText,
              onPressed: () {     
                var formValid = controller.formKey.currentState?.validate() ?? false;
                if (formValid) controller.criarAtualizar();
              },
            ),
          ),                   
        ],
      ),
    ),
  );
}