part of user_dashboard;

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

DataRow recentFileDataRow(UserInfoModel call, BuildContext context) {
  return DataRow(
    //onSelectChanged: (value) async =>  await Navigator.push(context, MaterialPageRoute(builder: (_) => CallDetailPage(call),),),
    cells: [
      //DataCell(Text('${call.callType.sigla} ${call.id}')),
      DataCell(Text('call.dataUltAtualizacao.toString()')),
      DataCell(Text('call.dataUltAtualizacao.toString()')),
      DataCell(Text('call.dataUltAtualizacao.toString()')),
      DataCell(Text('call.dataUltAtualizacao.toString()')),
      DataCell(Text('call.dataUltAtualizacao.toString()')),
      DataCell(Text('call.dataUltAtualizacao.toString()')),
      DataCell(Text('call.dataUltAtualizacao.toString()')),
    ],
  );
}