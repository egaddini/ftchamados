part of call_type_dashboard;

void saveCallTypeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      title: Center(child: Text("Cadastrar Tipo de Chamado", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        width: 350,
        child: SaveCallType(),
      ),
    )
  );
}

class SaveCallType extends StatefulWidget {
  const SaveCallType({super.key});

  @override
  State<SaveCallType> createState() => _SaveCallTypeState();
}

class _SaveCallTypeState extends State<SaveCallType> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _setor = TextEditingController();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _prioridadeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  List<Setor> _setores = [
    Setor(sigla: "sigla", nome: "nome"),
    Setor(sigla: "sigla", nome: "nome"),
    Setor(sigla: "sigla", nome: "nome"),
    Setor(sigla: "sigla", nome: "nome"),
  ];


  @override
  void dispose() {
    _setor.dispose();
    _tituloController.dispose();
    _prioridadeController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            addVerticalSpace(5),
            TypeAheadField<Setor>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _setor,
                decoration: const InputDecoration(
                  labelText: 'Cargo',
                  suffixIcon: Icon(Icons.arrow_drop_down),                                                          
                ),
              ),
              suggestionsCallback: (pattern) {
                return _setores;
              },
              itemBuilder: (context, Setor setor) {
                return ListTile(
                  title: Text(setor.nome),
                );
              },
              onSuggestionSelected: (Setor setor) async {
                setState(() {
                  _setor.text = setor.nome; 
                });
              },
            ),
            addVerticalSpace(10),
            TextFormField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
              validator: Validatorless.required('Titulo Obrigatório'), 
            ),         
            addVerticalSpace(10),
            TextFormField(
              controller: _prioridadeController,
              decoration: const InputDecoration(
                labelText: 'Prioridade',
              ),
              validator: Validatorless.required('Prioridade Obrigatório'), 
            ),         
            addVerticalSpace(10),
            TextFormField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
              ),
              validator: Validatorless.required('Descrição Obrigatório'), 
            ),         
            addVerticalSpace(10),
            Center(
              child: TextButton(
                child: const Icon(Icons.add, color: Colors.green), 
                onPressed: () async {     
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    setState(() {
                    });
                    // CallType(id: null, 
                    //   sigla: _siglaController.text,
                    //   setor: _setorController.text, 
                    //   titulo: _tituloController.text, 
                    //   prioridade: _prioridadeController.text, 
                    //   descricao: _descricaoController.text,
                    // );
                    // UserService userService = UserServiceImpl();
                    // userService.addCallType(                    
                    //   CallType(id: null, 
                    //   sigla: _siglaController.text,
                    //   setor: _setorController.text, 
                    //   titulo: _tituloController.text, 
                    //   prioridade: _prioridadeController.text, 
                    //   descricao: _descricaoController.text,
                    // ));
                    String response = 'null'; //await authRepository.authenticate(loginModel!);
                    // ignore: unnecessary_null_comparison
                    if (response != null) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('As credenciais informadas não batem. Tente novamente.'),
                          backgroundColor: Pallete.gradient3,
                        ),
                      );
                    }
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