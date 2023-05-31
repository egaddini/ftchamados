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

  TextEditingController _sigla = TextEditingController();
  TextEditingController _setor = TextEditingController();
  TextEditingController _titulo = TextEditingController();
  TextEditingController _prioridade = TextEditingController();
  TextEditingController _descricao = TextEditingController();
    // ProdutoService prodSvc = ProdutoServiceImpl();
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Center(child: Text("Novo Tipo de Chamado", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        height: 350,
        width: 350,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _sigla,
              labelText: 'Sigla',
              validator: [
                Validatorless.required('Sigla Obrigatório'),
              ]
            ),          
            addVerticalSpace(10),
            CustomTextFormField(
              controller: _setor,
              labelText: 'Setor',
              validator: [
                Validatorless.required('Setor Obrigatório'),
              ]
            ),          
            addVerticalSpace(10),         
            CustomTextFormField(
              controller: _titulo,
              labelText: 'Titulo',
              validator: [
                Validatorless.required('Titulo Obrigatório'),
              ]
            ),          
            addVerticalSpace(10),
            CustomTextFormField(
              controller: _prioridade,
              labelText: 'Prioridade',
              validator: [
                Validatorless.required('Prioridade Obrigatório'),
              ]
            ),          
            addVerticalSpace(10),        
            CustomTextFormField(
              controller: _descricao,
              labelText: 'Descrição',
              validator: [
                Validatorless.required('Descrição Obrigatório'),
              ]
            ), 
          ],
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {      
              Navigator.pop(context);
            },
            child: const Icon(Icons.add, color: Colors.green), 
          ),
        ),
      ],
    )
  );
}