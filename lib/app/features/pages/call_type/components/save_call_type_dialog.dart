part of call_type_dashboard;

void saveCallTypeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      title: Center(child: Text("Cadastrar Tipo de Chamado", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        width: 400,
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

  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _setorC = TextEditingController();
  final TextEditingController _tituloC = TextEditingController();
  final TextEditingController _prioridadeC = TextEditingController();
  final TextEditingController _descricaoC = TextEditingController();

  List<Setor> setores = [];
  List<PriorityModel> prioridades = [];

  @override
  void dispose() {
    _setorC.dispose();
    _tituloC.dispose();
    _prioridadeC.dispose();
    _descricaoC.dispose();
    super.dispose();
  }

    @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // myData.addAll(await callRepo.());
    // filterData.addAll(userList);
    await waitThreeSeconds();
    _setLoading();
  }

  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return isLoading ? buildLoadingIndicator() : SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            addVerticalSpace(5),
            TextFormField(
              controller: _tituloC,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
              validator: Validatorless.required('Titulo Obrigatório'), 
            ),         
            addVerticalSpace(10),
            TypeAheadField<Setor>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _setorC,
                decoration: const InputDecoration(
                  labelText: 'Setor',
                  suffixIcon: Icon(Icons.arrow_drop_down),                                                          
                ),
              ),
              suggestionsCallback: (pattern) {
                return setores;
              },
              itemBuilder: (context, Setor setor) {
                return ListTile(
                  title: Text(setor.nome),
                );
              },
              onSuggestionSelected: (Setor setor) async {
                setState(() {
                  _setorC.text = setor.nome; 
                });
              },
            ),
            addVerticalSpace(10),
            TypeAheadField<PriorityModel>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _prioridadeC,
                decoration: const InputDecoration(
                  labelText: 'Prioridades',
                  suffixIcon: Icon(Icons.arrow_drop_down),                                                          
                ),
              ),
              suggestionsCallback: (pattern) {
                return prioridades;
              },
              itemBuilder: (context, PriorityModel priority) {
                return ListTile(
                  title: Text(priority.nome),
                );
              },
              onSuggestionSelected: (PriorityModel priority) async {
                setState(() {
                  _prioridadeC.text = priority.nome; 
                });
              },
            ),         
            addVerticalSpace(10),
            TextFormField(
              controller: _descricaoC,
              maxLines: 5,
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
                    //   setor: _setorCController.text, 
                    //   titulo: _tituloC.text, 
                    //   prioridade: _prioridadeC.text, 
                    //   descricao: _descricaoC.text,
                    // );
                    // UserService userService = UserServiceImpl();
                    // userService.addCallType(                    
                    //   CallType(id: null, 
                    //   sigla: _siglaController.text,
                    //   setor: _setorCController.text, 
                    //   titulo: _tituloC.text, 
                    //   prioridade: _prioridadeC.text, 
                    //   descricao: _descricaoC.text,
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