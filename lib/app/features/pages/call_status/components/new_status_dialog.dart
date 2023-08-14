part of call_status;

void saveStatusDialog(BuildContext context, CallStatusController controller) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Center(child: Text("Novo Status", style: Get.theme.textTheme.titleLarge)),
      content: SizedBox(
        width: 350,
        child: SavePriority(controller: controller,),
      ),
    )
  );
}

class SavePriority extends StatefulWidget {

  final CallStatusController controller;
  
  const SavePriority({Key? key, required this.controller,}) : super(key: key);

  @override
  State<SavePriority> createState() => _SavePriorityState();
}

class _SavePriorityState extends State<SavePriority> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descricaoC = TextEditingController();
  final TextEditingController _nomeC = TextEditingController();
  final TextEditingController _pesoC = TextEditingController();

  bool _notificaC = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading ? buildLoadingIndicator() : SingleChildScrollView (
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            addVerticalSpace(5),
            TextFormField(
              controller: _nomeC,
              decoration: const InputDecoration(labelText: 'Nome',),
              validator: Validatorless.required('Nome Obrigatório'), 
            ),
            addVerticalSpace(10),                        
            TypeAheadField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _pesoC,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  suffixIcon: Icon(Icons.arrow_drop_down),                                                          
                ),
              ),
              suggestionsCallback: (pattern) {
                return widget.controller.pesos;
              },
              itemBuilder: (context, String peso) {
                return ListTile(
                  title: Text(peso),
                );
              },
              onSuggestionSelected: (String peso) async {
                _pesoC.text = peso;
              },
            ),
            addVerticalSpace(10),         
            TextFormField(
              controller: _descricaoC,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Descrição',),
              validator: Validatorless.required('Nome Obrigatório'), 
            ),
            addVerticalSpace(10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(value: _notificaC, onChanged: (value) {setState(() {
                  _notificaC = value!;
                });},),
                const Text('Notificar Usuário'),
              ],
            ),
            addVerticalSpace(10),
            Center(
              child: TextButton(
                child: const Icon(Icons.add, color: Colors.green), 
                onPressed: () {     
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    widget.controller.saveItem(CallStatusModel(id: null, name: _nomeC.text, description: _descricaoC.text, weight: int.parse(_pesoC.text), notify: _notificaC));                 
                  }
                },
              ),
            ),                   
          ],
        ),
      ),
    );
  }
}