part of call_sector;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  CallSectorController controller;

  RowSource({
    required this.myData,
    required this.count,
    required this.controller,
  });

  @override
  DataRow2? getRow(int index) {
    return (index < rowCount) ? recentFileDataRow(myData[index], controller, index) : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow2 recentFileDataRow(SectorModel sector, CallSectorController controller, int index) {
  return DataRow2(
    onSelectChanged: (value) => createUpdateSectorDialog(sector).then((value) => controller.atualizarItens()),
    cells: [
      DataCell(Text(sector.id.toString())),
      DataCell(Text(sector.acronym)),
      DataCell(Text(sector.name)),
      DataCell(SizedBox(height: 40, width: 40, child: cInkWell(22, 30, Icons.delete, Icons.delete_forever_outlined, Get.theme.primaryColor, Colors.red, 'Deletar', () => controller.deleteItem(index)))),        
    ],
  );
}