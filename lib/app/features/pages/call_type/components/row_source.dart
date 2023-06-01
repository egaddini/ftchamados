part of call_type_dashboard;

class RowSource extends DataTableSource {
  var myData;
  final count;
  final context;


  RowSource({
    required this.context,
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount) ? recentFileDataRow(myData![index], context) : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(CallType call, BuildContext context) {
  return DataRow(
    //onSelectChanged: (value) async =>  await Navigator.push(context, MaterialPageRoute(builder: (_) => CallDetailPage(call),),),
    cells: [
      DataCell(Text('${call.id}')),
      DataCell(Text('${call.sigla}')),
      DataCell(Text('${call.setor}')),
      DataCell(Text('${call.titulo}')),
      DataCell(Text('${call.prioridade}')),
      DataCell(Text('${call.descricao}')),
      DataCell(
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            removeCallType(context, call);
          },
          child:  const SizedBox(
            width: 35,
            height: 35,
            child: Icon(Icons.delete_outline_outlined),
          ),
        ),
      ),
    ],
  );
}

void removeCallType(BuildContext context, CallType call) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Deletar Tipo de Chamado"),
          content: Text("O usuário: ${call.titulo ?? "?"} será deletado para sempre, deseja realmente continuar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Voltar",
                style: TextStyle(color: Pallete.backgroundColor),
              ),
            ),
            TextButton(
              onPressed: () {
                /// setState(() {
                ///   users.remove(user);
                ///   Navigator.pop(context);
                /// });
                Navigator.pop(context);
              },
              child: const Text(
                "Deletar",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        )
      );
}

void addCallType(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const AlertDialog(
      title: Center(child: Text("Novo Tipo de Chamado", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        height: 390,
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

  TextEditingController _siglaController = TextEditingController();
  TextEditingController _setorController = TextEditingController();
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _prioridadeController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  @override
  void dispose() {

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
                    CallType(id: null, 
                      sigla: _siglaController.text,
                      setor: _setorController.text, 
                      titulo: _tituloController.text, 
                      prioridade: _prioridadeController.text, 
                      descricao: _descricaoController.text,
                    );
                    UserService userService = UserServiceImpl();
                    userService.addCallType(                    CallType(id: null, 
                      sigla: _siglaController.text,
                      setor: _setorController.text, 
                      titulo: _tituloController.text, 
                      prioridade: _prioridadeController.text, 
                      descricao: _descricaoController.text,
                    ));                     
                    String? response = 'asd'; //await authRepository.authenticate(loginModel!);
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