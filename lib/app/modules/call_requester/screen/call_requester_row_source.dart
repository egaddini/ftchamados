part of call_user_dashboard;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;

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

DataRow recentFileDataRow(Call call) {
  String status = call.status;
  return DataRow(
    onSelectChanged: (value) => Get.dialog(
      CallRequesterDetailDialog(controller: Get.put(CallRequesterDetailDialogController(call.id, CallRequesterDetailDialogRepository(Get.find()))))
    ).then(
      (value) => {
        Get.delete<CallRequesterDetailDialogController>(),
        if (value != null) status = value,
      }
    ),
    cells: [
      DataCell(Text(call.callType!.title!)),
      DataCell(Text(call.callType!.sector!.name)),
      DataCell(Text(call.callType!.priority!.name)),
      DataCell(Text(status)),
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(call.dataCriacao)).toString())),
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(call.dataUltAtualizacao)).toString())),
      //DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(user.dataCriacao!).toString())),
    ],
  );
}
