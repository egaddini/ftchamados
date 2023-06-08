part of call_type_dashboard;

class SaveSetor extends StatefulWidget {
  
  const SaveSetor({super.key});

  @override
  State<SaveSetor> createState() => _SaveSetorState();
}

class _SaveSetorState extends State<SaveSetor> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _siglaC = TextEditingController();
  final TextEditingController _nomeC = TextEditingController();

  final SetorRepository setorRep = SetorRepositoryImpl();

    bool isLoading = false;

  @override
  void dispose() {
    _siglaC.dispose();
    _nomeC.dispose();
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
              controller: _siglaC,
              decoration: const InputDecoration(
                labelText: 'Sigla',
              ),
              validator: Validatorless.required('Sigla Obrigatório'), 
            ),         
            addVerticalSpace(10),
            TextFormField(
              controller: _nomeC,
              decoration: const InputDecoration(
                labelText: 'Setor',
              ),
              validator: Validatorless.required('Setor Obrigatório'), 
            ),         
            
            addVerticalSpace(10),
            Center(
              child: TextButton(
                child: const Icon(Icons.add, color: Colors.green), 
                onPressed: () {     
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                  _setLoading();
                  setorRep.register(Setor(nome: _nomeC.text, sigla: _siglaC.text)).then((_) {
                  Navigator.pop(context);
                  snackSucessRegister(context, 'Setor ${_nomeC.text} registrado com sucesso!');
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

void registrarSetor(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      title: Center(child: Text('Registrar Setor', style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        width: 350,
        child: SaveSetor()
      ),
      actions: null,
    )
  );
}
