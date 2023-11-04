
import 'package:chamados/app/modules/call/dashboard/call_dashboard_controller.dart';
import 'package:chamados/app/modules/call/dashboard/widget/detail_dialog/call_detail_dialog_controller.dart';
import 'package:chamados/app/modules/call/dashboard/widget/detail_dialog/call_detail_dialog_repository.dart';
import 'package:chamados/core/utils/masks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/call.dart';
import 'widget/detail_dialog/call_detail_dialog.dart';

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
  return DataRow(
    onSelectChanged: (value) => Get.dialog(
      CallDetailDialog(controller: Get.put(CallDetailDialogController(call.id, CallDetailDialogRepository(Get.find()))))
    ).then(
      (value) => {
        Get.delete<CallDetailDialogController>(),
        if (value != null) {
          call.status = value,
          Get.find<CallDashboardController>().data.refresh(),
        }
      }
    ),
    cells: [
      DataCell(Text(call.callType!.title!)),
      DataCell(Text(call.callType!.sector!.name)),
      DataCell(Text(call.callType!.priority!.name)),
      DataCell(Text(call.solicitante!.email)),
      DataCell(Text(call.responsavel == null ? 'não definido' : call.responsavel!.email)),
      DataCell(Text(call.status.toString())),
      DataCell(Text(Masks.dateTimeMask(call.dataCriacao))),
      DataCell(Text(Masks.dateTimeMask(call.dataUltAtualizacao))),
      //DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(user.dataCriacao!).toString())),
    ],
  );
}
