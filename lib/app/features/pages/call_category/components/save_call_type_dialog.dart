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

  final CallTypeRepository callTypeRepo = CallTypeRepositoryImpl();
  final SetorRepository setorRepo = SetorRepository();
  final PriorityRepository priRepo = PriorityRepository();

  List<Setor> setores = [];
  List<PriorityModel> prioridades = [];

  late Setor _setor;
  late PriorityModel _priority;
  
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
    setores.addAll(await setorRepo.getList());
    prioridades.addAll(await priRepo.getList());
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
                  _setor = setor;
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
                  _priority = priority;
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
                onPressed: () {     
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    _setLoading();
                    callTypeRepo.register(CallTypeDTO(titulo: _tituloC.text, setorId: _setor.id!, prioridadeId: _priority.id!, descricao: _descricaoC.text)).then((_) {
                    Navigator.pop(context);
                    snackSucessRegister(context, 'Prioridade ${_descricaoC.text} registrado com sucesso!');
                    }).catchError((error) {
                      Navigator.pop(context);
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