import 'package:chamados/app/models/call.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CallRequesterDetailDialogController extends GetxController {

  final Call call;

  bool isHovered = false;

  late TextEditingController dataAberturaC;
  late TextEditingController ultAtualizacaoC;
  late TextEditingController solicitanteC;
  late TextEditingController statusC;
  late TextEditingController setorC;
  late TextEditingController prioridadeC;
  late TextEditingController tituloC;
  late TextEditingController descSolicitC;

  CallRequesterDetailDialogController(this.call);

  @override
  void onInit() {
    dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(call.dataCriacao)));
    ultAtualizacaoC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(call.dataUltAtualizacao)));
    solicitanteC = TextEditingController(text: call.solicitante!.email);
    statusC = TextEditingController(text: call.status);
    setorC = TextEditingController(text: call.callType!.sector!.nome);
    prioridadeC = TextEditingController(text: call.callType!.prioridade!.nome);
    tituloC = TextEditingController(text: call.callType!.titulo);
    descSolicitC = TextEditingController(text: call.descricao);
    super.onInit();
  }

  callHistoric() {
    showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        title: Center(child: Text('Histórico do chamado', style: Get.theme.textTheme.headlineMedium!)),
        content: SizedBox(
          width: 1200 ,
          child: historicForm(),
        ),
      )
    );
  }

  Padding historicForm() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: DataTable2(
             
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns:  [
              DataColumn2(label: Text('Data', style: Get.theme.textTheme.titleMedium!), size: ColumnSize.L,),
              DataColumn2(label: Text('Usuário', style: Get.theme.textTheme.titleMedium!), size: ColumnSize.L,),
              DataColumn2(label: Text('Ação', style: Get.theme.textTheme.titleMedium!), size: ColumnSize.L,),
            ],
            rows: List<DataRow>.generate(
                call.historico.length,
                (index) => DataRow(cells: [
                      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(call.historico[index].dateTime!)))),
                      DataCell(Text(call.historico[index].user!)),
                      DataCell(Text(call.historico[index].message!)),
                    ]))),
    );
  }

}