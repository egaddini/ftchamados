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
    ],
  );
}