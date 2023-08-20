part of call_sector;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  BuildContext context;
  CallSectorController controller;

  RowSource({
    required this.context,
    required this.myData,
    required this.count,
    required this.controller,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount) ? recentFileDataRow(myData[index], context, controller, index) : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(SectorModel sector, BuildContext context, CallSectorController controller, int index) {
  return DataRow(
    onSelectChanged: (value) => createUpdateSectorDialog(sector),
    cells: [
      DataCell(Text(sector.id.toString())),
      DataCell(Text(sector.sigla)),
      DataCell(Text(sector.nome)),
      DataCell(SizedBox(height: 40, width: 40, child: cInkWell(22, 30, Icons.delete, Icons.delete_forever_outlined, Get.theme.primaryColor, Colors.red, 'Deletar', () => controller.deleteItem(index)))),        
    ],
  );
}