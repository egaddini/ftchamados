// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/data/models/call.dart';
import 'package:chamados/app/modules/call_requester/detail_dialog/call_requester_detail_dialog_repository.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/masks.dart';
import '../../../widgets/custom_drop_down_menu_button/menu_item.dart';

class CallRequesterDetailDialogController extends GetxController with StateMixin<Call> {
  
  final int callID;
  final CallRequesterDetailDialogRepository repository;
  late Call call;

  late RxString statusC;
  List<DropdownMenuItem> itens = [];

  CallRequesterDetailDialogController(
    this.callID,
    this.repository,
  );

  @override
  void onInit() {
    startItens();
    repository.findById(callID).then((value) => {
      call = value,
      statusC = value.status.obs,
      change(value, status: RxStatus.success()),
    });

    super.onInit();
  }

  startItens() {
    itens = [
      MenuItem(text: 'Editar', icon: Icons.edit_outlined, function: () => {}),
      MenuItem(text: 'Cancelar', icon: Icons.cancel_presentation_rounded, function: () => alterarStatusChamado(9)),
      MenuItem(text: 'Finalizar', icon: Icons.check_box_outlined, function: () => alterarStatusChamado(10)),
      MenuItem(text: 'Histórico', icon: Icons.history_outlined, function: (() => callHistoric())),
      MenuItem(text: 'Compartilhar', icon: Icons.share_outlined, function: () {})
    ].map((x) => toDropdownMenuItem(x)).toList();
  }

  alterarStatusChamado(int status) async {
    repository.setStatus(callID, status).then((value) {
      statusC.value = value.name;
      statusC.refresh();
      snackSucessRegister('Registrado com sucesso', 'Chamado encerrado com sucesso!');
    }).catchError((error) {
      tratar(error);
    });
  }

  callHistoric() {
    showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        titlePadding: const EdgeInsets.only(top: 10),
        title: AppBar(
          title: const Text('Histórico do chamado'),
          forceMaterialTransparency: true,
          actions: const [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
          ]        
        ),
        
        //Center(child: Text('Histórico do chamado',style: Get.theme.textTheme.headlineMedium!)),
        content: SizedBox(
          width: 1200,
          child: historicForm(),
        ),
      )
    );
  }

  DataTable2 historicForm() {
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 600,
      columns: ['Data', 'Usuário', 'Ação'].map((x) => DataColumn2(label: Text(x, style: Get.theme.textTheme.titleMedium!)),).toList(),
      rows: call.historico.map((e) => 
        DataRow(
          cells: [
            DataCell(Text(e.ocurrenceDT == null ? '' : Masks.dateTimeMask(e.ocurrenceDT!))),
            DataCell(Text(e.user!)),
            DataCell(Text(e.message!)),
          ],
        ),
      ).toList(),
    );
  }

  DropdownMenuItem toDropdownMenuItem(MenuItem item) {
    return DropdownMenuItem<MenuItem>(
      value: item,
      child: Row(
        children: [
          Icon(item.icon, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              item.text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
  




}
