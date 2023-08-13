part of call_type_dashboard;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  BuildContext context;


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
      DataCell(Text(call.setor.sigla)),
      DataCell(Text(call.setor.nome)),
      DataCell(Text(call.titulo)),
      DataCell(Text(call.prioridade.nome)),
      DataCell(Text(call.descricao)),
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
