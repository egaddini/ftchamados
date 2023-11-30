// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/data/models/call.dart';
import 'package:chamados/app/data/models/rating_model.dart';
import 'package:chamados/app/modules/call_requester/detail_dialog/call_requester_detail_dialog_repository.dart';
import 'package:chamados/app/modules/call_requester/widgets/rating_star_widget.dart';
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

  RxInt satisfacao = 0.obs, tempo = 0.obs;
  String feedback = '';

  final Icon starBorder = const Icon(Icons.star_border_outlined, size: 50, color: Colors.yellowAccent), star = const Icon(Icons.star_outlined, size: 50, color: Colors.yellowAccent);

  late RxString statusC;
  List<DropdownMenuItem> itens = [];

  CallRequesterDetailDialogController(
    this.callID,
    this.repository,
  );

  @override
  void onInit() {
    repository.findById(callID).then((value) => {
      call = value,
      statusC = value.status.obs,
      startItens(statusC.value),
      change(value, status: RxStatus.success()),
    });
    super.onInit();
  }

  startItens(String status) {
    if (['Finalizado', 'Cancelado'].firstWhereOrNull((x) => x == status) == null) {
      itens.addAll(
        [
          MenuItem(text: 'Editar', icon: Icons.edit_outlined, function: () {}),
          MenuItem(text: 'Cancelar', icon: Icons.cancel_presentation_rounded, function: () => alterarStatusChamado(9)),
          MenuItem(text: 'Finalizar', icon: Icons.check_box_outlined, function: () => alterarStatusChamado(10)),
        ].map((x) => toDropdownMenuItem(x)).toList()
      );
    }
    itens.addAll(
      [
        MenuItem(text: 'Histórico', icon: Icons.history_outlined, function: (() => callHistoric())),
        MenuItem(text: 'Compartilhar', icon: Icons.share_outlined, function: () {})
      ].map((x) => toDropdownMenuItem(x)).toList()
    );

  }

  alterarStatusChamado(int status) async {
    repository.setStatus(callID, status).then((value) async {
      statusC.value = value.name;
      statusC.refresh();
      Get.back(result: statusC.value);
      await ratingDialog();
      snackSucessRegister('${value.description} com sucesso', 'Chamado ${value.description}. com sucesso!');
    }).catchError((error) {
      tratar(error);
    });
  }

  callHistoric() async {
    return await showDialog(
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
          child: DataTable2(
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
          ),
        ),
      )
    );
  }

  ratingDialog() {
    showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        titlePadding: const EdgeInsets.only(top: 10),
        actionsPadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.only(top: 0, right: 16, left: 16, bottom: 16), 
        title: null,
        content: SizedBox(
          width: Get.width * 0.15 >= 300 ? Get.width * 0.15 : 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () => Get.back(), child: Text('Pular', style: Get.textTheme.bodySmall)),
                  ],
                ),
              ),
              Center(child: Text('Avalie seu atendimento', style: Get.textTheme.titleLarge)),
              addVerticalSpace(15),
              Text('Satisfação com a solução', style: Get.textTheme.bodySmall),
              RatingStarWidget(value: satisfacao),
              addVerticalSpace(15),
              Text('Tempo de solução', style: Get.textTheme.bodySmall),
              RatingStarWidget(value: tempo),
              addVerticalSpace(15),
              Text('Feedback', style: Get.textTheme.bodySmall),
              TextField(controller: TextEditingController(text: feedback), maxLines: 3, maxLength: 500)
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              child: const Text('Enviar'), 
              onPressed: () => repository.rate(RatingModel(callID: callID, satisfaction: satisfacao.value, solveTime: tempo.value, feedback: feedback)).then((value) => Get.back(closeOverlays: true)) ),
          )
        ],
      )
    ).then((value) => {
      Get.back,
      snackSucessRegister('Obrigado por avaliar', 'Agradecemos sinceramente pelo seu feedback, pois é por meio dele que conseguimos aprimorar nossos serviços. Sua contribuição é valiosa para nós. Obrigado!'),
    });
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
