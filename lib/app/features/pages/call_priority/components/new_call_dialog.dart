part of call_dashboard;

void newCallDialog(BuildContext context, CallType call) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Center(child: Text(call.titulo, style: const TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        width: 600,
        child: NewCallForm(call: call),
      ),
    )
  );
}

class NewCallForm extends StatefulWidget {
  
  final CallType call;

  const NewCallForm({super.key, required this.call});

  @override
  State<NewCallForm> createState() => NewCallFormState();
}

class NewCallFormState extends State<NewCallForm> {

  bool isLoading = true;

  late CallType _callType;
  late TextEditingController _descreverProblemaC;
  TextEditingController? emailUsuarioC = TextEditingController();
  final TextEditingController _dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now()));
  final CallRepository _callRepo = CallRepositoryImpl();
  
  late UserInfoModel? _logedUser; 

  @override
  void initState() {
    super.initState();
    _init();
    _callType =  widget.call;
    _descreverProblemaC = TextEditingController(text: '');
  }

  Future<void> _init() async {
    waitThreeSeconds();
     _logedUser = await LocalStorageServices().getUser();
     emailUsuarioC!.text =  _logedUser!.email!;
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
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          addVerticalSpace(10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: _callType.setor.nome),
                  decoration: const InputDecoration(
                    labelText: 'Setor',
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: _callType.titulo),
                  decoration: const InputDecoration(
                    labelText: 'Titulo',
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: _callType.prioridade.nome),
                  decoration: const InputDecoration(
                    labelText: 'Prioridade',
                  ),
                ),
              ),                
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: _callType.descricao),                    
                  decoration:const InputDecoration(
                    labelText: 'Descrição do chamado',
                  ),
                ),
              ),
            ],
          ),
          addHorizontalSpace(10),
          const Row(
            children: [
              Expanded(child:Divider(),),
            ],
          ),
          addHorizontalSpace(10),
          Row(
            children: [ 
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: _dataAberturaC,
                  decoration: const InputDecoration(
                    labelText: 'Data de abertura da solicitação',
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: emailUsuarioC,                    
                  decoration: const InputDecoration(
                    labelText: 'Usuário solicitante',
                  ),
                ),
              ),                
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _descreverProblemaC,
                  maxLines: 10,
                  decoration: const  InputDecoration(
                    labelText: 'Descreva o problema',
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(10),
          FilledButton(
            child: const Text(
              'Registrar chamado',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onPressed: () {
              setState(() {
                CallDTO call = CallDTO(solicitante: _logedUser!.id!, callType: _callType.id!, descricao: _descreverProblemaC.text);
                _setLoading();
                _callRepo.register(call).then((_) {
                Navigator.pop(context);
                snackSucessRegister(context, 'Chamado registrado com sucesso!');
                }).catchError((error) {
                  Navigator.pop(context);
                  tratarErro(context, error);
                });              
              });
            }, 
          ),
        ],
      ),
    );
  }
}