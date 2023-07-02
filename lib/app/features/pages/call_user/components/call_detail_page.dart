part of call_user_dashboard;

void callDetailDialog(BuildContext context, Call call) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: null,
      content: SizedBox(
        width: 1200 ,
        child: CallDetailPage(call),
      ),
    )
  );
}

class CallDetailPage extends StatefulWidget {
  final Call call;

  const CallDetailPage(this.call, {super.key});

  @override
  CallDetailPageState createState() => CallDetailPageState();
}

class CallDetailPageState extends State<CallDetailPage> {

   bool isHovered = false;

  late TextEditingController _dataAberturaC;
  late TextEditingController _ultAtualizacaoC;
  late TextEditingController _solicitanteC;
  late TextEditingController _statusC;
  late TextEditingController _setorC;
  late TextEditingController _prioridadeC;
  late TextEditingController _tituloC;
  late TextEditingController _descSolicitC;

  @override
  void initState() {
    super.initState();
    _dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(widget.call.dataCriacao)));
    _ultAtualizacaoC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(widget.call.dataUltAtualizacao)));
    _solicitanteC = TextEditingController(text: widget.call.solicitante!.email);
    _statusC = TextEditingController(text: widget.call.status);
    _setorC = TextEditingController(text: widget.call.callType!.setor.nome);
    _prioridadeC = TextEditingController(text: widget.call.callType!.prioridade.nome);
    _tituloC = TextEditingController(text: widget.call.callType!.titulo);
    _descSolicitC = TextEditingController(text: widget.call.descricao);
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            children: [
              CustomExpandedTextField(controller: _tituloC, labelText: 'Titulo'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CustomExpandedTextField(controller: _setorC, labelText: 'Setor'),
              const SizedBox(width: 10),
              CustomExpandedTextField(controller: _statusC, labelText: 'Status'),  
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CustomExpandedTextField(controller: _solicitanteC, labelText: 'Solicitante'),
              const SizedBox(width: 10),
              CustomExpandedTextField(controller: _prioridadeC, labelText: 'Prioridade'),                              
              const SizedBox(width: 10),
              CustomExpandedTextField(controller: _dataAberturaC, labelText: 'Abertura'),
              const SizedBox(width: 10),
              CustomExpandedTextField(controller: _ultAtualizacaoC, labelText: 'Ultima atualização'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CustomExpandedTextField(controller: _descSolicitC, labelText: 'Descrição do solicitante', maxLines: 8),
            ],
          ),          
          const SizedBox(height: 10),
          const SizedBox(child: Expanded(child: Divider())),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: TextEditingController(),
                  maxLines: 1,
                  decoration: InputDecoration(
                    label: const Text('Escreva ...'),
                    suffixIcon: MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          isHovered = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          isHovered = false;
                        });
                      },
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: isHovered ? Pallete.gradient3 : Colors.black,
                        ),
                        onPressed: () {
                          // Ação do botão
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),            
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.call.descricao = _tituloC.text;
                  Navigator.pop(context, widget.call);
                },
                child: const Text('Cancelar'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  widget.call.descricao = _tituloC.text;
                  Navigator.pop(context, widget.call);
                },
                child: const Text('Finalizar'),
              ),                                                
            ],
          ),
        ],
      ),
    );
  }
}