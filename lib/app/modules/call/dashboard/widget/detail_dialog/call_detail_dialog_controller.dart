// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/data/models/call.dart';
import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/app/modules/call/dashboard/widget/detail_dialog/call_detail_dialog_repository.dart';
import 'package:chamados/app/widgets/custom_drop_down_menu_button/menu_item.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:chamados/core/utils/masks.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallDetailDialogController extends GetxController with StateMixin<Call> {
  
  final int callID;
  final CallDetailDialogRepository repository;
  late Call call;
  RxBool isSolverDefined = false.obs;
  late RxString solver = ''.obs;
  late UserInfoModel logedUser;
  late RxString statusC;
  List<DropdownMenuItem> itens = [];

  CallDetailDialogController(
    this.callID,
    this.repository,
  );

  @override
  void onInit() {
    logedUser = AppConfigService().to().userData();
    repository.findById(callID).then((value) => {
      call = value,
      statusC = value.status.obs,
      solver.value = value.responsavel == null ? '' : value.responsavel!.email,
      startItens(statusC.value),
      change(value, status: RxStatus.success()),
    });
    super.onInit();
  }

  startItens(String status) {
    itens.addAll(
      [
        MenuItem(text: 'Histórico', icon: Icons.history_outlined, function: (() => callHistoric())),
        MenuItem(text: 'Compartilhar', icon: Icons.share_outlined, function: () {})
      ].map((x) => toDropdownMenuItem(x)).toList()
    );

  }

  alterarStatusChamado(int status) async {
    repository.setStatus(callID, status).then((value) {
      statusC.value = value.name;
      statusC.refresh();
      Get.back(result: statusC.value);
      snackSucessRegister('${value.description} com sucesso', 'Chamado ${value.description}. com sucesso!');
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
          actions: const [Padding(padding: EdgeInsets.symmetric(horizontal: 20.0))]        
        ),
        content: SizedBox(
          width: Get.width * 0.3,
          height: Get.height * 0.6,
          child: historicForm(),
        ),
      )
    );
  }

  Widget historicForm() {
    return DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        columns: ['Data', 'Usuário', 'Ação'].map((x) => DataColumn2(label: Text(x, style: Get.theme.textTheme.titleMedium!)),).toList(),
        rows: call.historico.map(
          (e) => DataRow2(
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

  setSolver() => solver.value = solver.value.isEmpty ? logedUser.email! : ''; 

  // setUser(String? x) => selectedUser = x ?? '';
  




}
