// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/call_status/call_status_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chamados/app/models/call_status_model.dart';

class CreateUpdateStatusController extends GetxController {

  final CallStatusModel? status;

  CallStatusRepository callRepository = CallStatusRepository();

  final formKey = GlobalKey<FormState>();
  final TextEditingController descricaoC = TextEditingController();
  final TextEditingController nomeC = TextEditingController();
  TextEditingController pesoC = TextEditingController();

  RxBool isLoading = false.obs, notificaC = false.obs;

  late Text buttonText;

  final RxList<String> pesos = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'].obs;
  
  CreateUpdateStatusController({this.status,});
  
  @override
  void onInit() {
    buttonText = Text(status == null ? "Adicionar": "Atualizar");
    if (status != null) {
      descricaoC.text = status!.description;
      nomeC.text = status!.name;
      pesoC.text = status!.weight.toString();
      notificaC.value = status!.notify;
    }
    super.onInit();
  }

  void criarAtualizarStatus() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      status == null ?
      saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value)):
      saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value));
    }
  }

    void saveItem(CallStatusModel status) async {
    isLoading.value = true;
    callRepository.register(status).then((_) async {
      await callRepository.getByName(status.name);
      // refreshValoresDisponiveis();
      Get.back();
      snackSucessRegister(Get.context!, 'Status ${status.name} registrado com sucesso!');
    }).catchError((error) {
      Get.back();
      tratarErro(Get.context!, error);
    });  
  }

}
