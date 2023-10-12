import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/modules/call_priority/priority_repository.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../data/models/priority.dart';

class CreateUpdatePriorityController extends GetxController {
  final PriorityModel? priority;
  final PriorityRepository setorRep = PriorityRepository();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nomeC = TextEditingController();
  RxBool isLoading = false.obs;
  TextEditingController pesoC = TextEditingController();
  late Text buttonText;

  late RxList<int> pesos = <int>[].obs;

  CreateUpdatePriorityController({
    this.priority,
  });

  @override
  void onInit() async {
    bool parametro = validaParametro();
    buttonText = Text(parametro ? "Adicionar" : "Atualizar");
    if (!parametro) {
      pesoC.text = priority!.weight.toString();
      nomeC.text = priority!.name;
    }
    pesos.value = (await setorRep.getFreeWeights()).obs;
    super.onInit();
  }

  bool validaParametro() => priority == null ? true : false;

  void criarAtualizarStatus() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      priority == null
          ? saveItem(
              PriorityModel(name: nomeC.text, weight: int.parse(pesoC.text)))
          : null;
      // saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value)):
      // saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value));
    }
  }

  void saveItem(PriorityModel priority) async {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      isLoading.value = false;
      setorRep.register(priority).then((_) {
        Get.back();
        snackSucessRegister('Registrado com sucesso',
            'Prioridade ${nomeC.text} registrado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(error);
      });
    }
  }
}
