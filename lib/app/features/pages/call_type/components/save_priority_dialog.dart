part of call_type_dashboard;

void savePriorityDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      title: Center(child: Text("Nova Prioridade", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        width: 350,
        child: SavePriority(),
      ),
    )
  );
}

class SavePriority extends StatefulWidget {
  const SavePriority({super.key});

  @override
  State<SavePriority> createState() => _SavePriorityState();
}

class _SavePriorityState extends State<SavePriority> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pesoC = TextEditingController();
  final TextEditingController _descricaoC = TextEditingController();

  bool isLoading = false;

  final List<String> _pesos = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  PriorityRepository priRepo = PriorityRepositoryImpl();

  @override
  void dispose() {
    _pesoC.dispose();
    _descricaoC.dispose();
    super.dispose();
  }
  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return isLoading ? buildLoadingIndicator() : SingleChildScrollView (
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            addVerticalSpace(5),
            TextFormField(
              controller: _descricaoC,
              decoration: const InputDecoration(
                labelText: 'Setor',
              ),
              validator: Validatorless.required('Setor Obrigatório'), 
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
                return _pesos;
              },
              itemBuilder: (context, String peso) {
                return ListTile(
                  title: Text(peso),
                );
              },
              onSuggestionSelected: (String peso) async {
                setState(() {
                  _pesoC.text = peso; 
                });
              },
            ),         
            addVerticalSpace(10),
            Center(
              child: TextButton(
                child: const Icon(Icons.add, color: Colors.green), 
                onPressed: () {     
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                  _setLoading();
                  priRepo.register(PriorityModel(nome: _descricaoC.text, peso: int.parse(_pesoC.text))).then((_) {
                  Navigator.pop(context);
                  snackSucessRegister(context, 'Prioridade ${_descricaoC.text} registrado com sucesso!');
                  }).catchError((error) {
                    tratarErro(context, error);
                  });                    
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