part of call_dashboard;

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

DataRow recentFileDataRow(Call call, BuildContext context) {
  return DataRow(
    onSelectChanged: (value) async =>  await Navigator.push(context, MaterialPageRoute(builder: (_) => CallDetailPage(call),),),
    cells: [
      DataCell(Text('${call.callType!.sigla} ${call.id}')),
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(call.dataCriacao).toString())),
      DataCell(Text(call.callType!.setor.toString())),
      DataCell(Text(call.callType!.prioridade.toString())),
      DataCell(Text(call.solicitante.email.toString())),
      DataCell(Text(call.status.toString())),
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(call.dataUltAtualizacao).toString())),
      //DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(user.dataCriacao!).toString())),
    ],
  );
}