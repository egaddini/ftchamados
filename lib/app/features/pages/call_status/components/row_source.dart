part of call_status;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  BuildContext context;
  CallStatusController controller;

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

DataRow recentFileDataRow(CallStatusModel status, BuildContext context, CallStatusController controller, int index) {
  return DataRow(
    onSelectChanged: (value) async => await createUpdateStatusDialog(status).then((value) => controller.myData.refresh()),
    cells: [
      DataCell(Text(status.id.toString())),
      DataCell(Text(status.name)),
      DataCell(Text(status.description)),
      DataCell(Text(status.weight.toString())),
      DataCell(Checkbox(value: status.notify, onChanged: (value) => controller.setValue(index),),),
      DataCell(SizedBox(height: 40, width: 40, child: cInkWell(22, 30, Icons.delete, Icons.delete_forever_outlined, Get.theme.primaryColor, Colors.red, 'Deletar', () => controller.deleteItem(index)))),        
    ],
  );
}