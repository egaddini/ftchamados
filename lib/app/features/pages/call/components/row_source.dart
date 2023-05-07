part of call_dashboard;

class RowSource extends DataTableSource {
  var myData;
  final count;


  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount) ? recentFileDataRow(myData![index]) : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(Call data) {
  return DataRow(
    onSelectChanged: (value) => print('object'),
    cells: [
      DataCell(Text(data.dataCriacao.toString())),
      DataCell(Text(data.callType.setor.toString())),
      DataCell(Text(data.callType.prioridade.toString())),
      DataCell(Text(data.usuario)),
      DataCell(Text(data.status.toString())),
      DataCell(Text(data.dataUltAtualizacao.toString())),
    ],
  );
  
}