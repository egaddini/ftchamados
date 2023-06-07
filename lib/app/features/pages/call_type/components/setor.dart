part of call_type_dashboard;

class SaveSetor extends StatefulWidget {
  
  const SaveSetor({super.key});

  @override
  State<SaveSetor> createState() => _SaveSetorState();
}

class _SaveSetorState extends State<SaveSetor> {

final _formKey = GlobalKey<FormState>();

final TextEditingController _siglaController = TextEditingController();
final TextEditingController _setorController = TextEditingController();

final SetorRepository setorRep = SetorRepositoryImpl();

@override
void dispose() {
  _siglaController.dispose();
  _setorController.dispose();
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
            TextFormField(
              controller: _siglaController,
              decoration: const InputDecoration(
                labelText: 'Sigla',
              ),
              validator: Validatorless.required('Sigla Obrigatório'), 
            ),         
            addVerticalSpace(10),
            TextFormField(
              controller: _setorController,
              decoration: const InputDecoration(
                labelText: 'Setor',
              ),
              validator: Validatorless.required('Setor Obrigatório'), 
            ),         
            
            addVerticalSpace(10),
            Center(
              child: TextButton(
                child: const Icon(Icons.add, color: Colors.green), 
                onPressed: () async {     
                  var formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                      try {
                        waitProgressBar(context); 
                        await setorRep.register(Setor(id: null, sigla: _siglaController.text, nome: _setorController.text,));                     
                        Navigator.of(context).pop();
                        registerSucess(context, 'Registrado com sucesso', 'Agora aguarde algum administrador habilitar sua conta');
                      } on DioError catch (e) {
                        Navigator.of(context).pop();
                        if (e.response != null && e.response!.data != null) {
                          ErrorDTO erro = ErrorDTO.fromMap(e.response!.data);
                          if (409.isEqual(erro.status)) {
                            final snackBar = SnackBar(
                              content: Text(erro.message),
                              action: SnackBarAction(
                                label: 'Ver Mais',
                                onPressed: () {
                                  moreDetailsDialog(context, 'Já Registrado', erro.message);
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        } else {
                          final snackBar = SnackBar(
                            content: const Text('Algum problema aconteceu!'),
                            action: SnackBarAction(
                              label: 'Ver Mais',
                              onPressed: () {
                                moreDetailsDialog(context, 'Algum problema aconteceu!', 'se o problema persistir entre em contato com o suporte \n${e.error}');
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
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

void registrarSetor(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      title: Center(child: Text('Registrar Setor', style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SaveSetor(),
      actions: [
      ],
    )
  );
}

