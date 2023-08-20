part of call_dashboard;

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

DataRow recentFileDataRow(Call call, BuildContext context) {
  return DataRow(
    onSelectChanged: (value) async =>  await Navigator.push(context, MaterialPageRoute(builder: (_) => CallDetailPage(call),),),
    cells: [
      DataCell(Text('${call.callType!.sector!.sigla} ${call.id}')),
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(call.dataCriacao)).toString())),
      DataCell(Text(call.callType!.sector!.nome)),
      DataCell(Text(call.callType!.prioridade!.nome)),
      DataCell(Text(call.solicitante!.email.toString())),
      DataCell(Text(call.status.toString())),
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(call.dataUltAtualizacao)).toString())),
      //DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(user.dataCriacao!).toString())),
    ],
  );
}