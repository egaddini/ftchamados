part of 'call_priority_screen.dart';

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  CallPriorityController controller;

  RowSource({
    required this.myData,
    required this.count,
    required this.controller,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount)
        ? recentFileDataRow(myData[index], controller, index)
        : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(
    PriorityModel priority, CallPriorityController controller, int index) {
  return DataRow(
    onSelectChanged: (value) => createUpdatePriorityDialog(priority)
        .then((value) => controller.atualizarItens()),
    cells: [
      DataCell(Text(priority.id.toString())),
      DataCell(Text(priority.name)),
      DataCell(Text(priority.weight.toString())),
      DataCell(SizedBox(
          height: 40,
          width: 40,
          child: cInkWell(
              22,
              30,
              Icons.delete,
              Icons.delete_forever_outlined,
              Get.theme.primaryColor,
              Colors.red,
              'Deletar',
              () => controller.deleteItem(index)))),
    ],
  );
}
