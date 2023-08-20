import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/priority/priority_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdatePriorityController extends GetxController {

  final PriorityModel? priority;
  final PriorityRepository setorRep = PriorityRepository();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nomeC = TextEditingController();
  RxBool isLoading = false.obs;
  TextEditingController pesoC = TextEditingController();
  late Text buttonText;

  final List<String> pesos = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  CreateUpdatePriorityController({this.priority,});
  
  @override
  void onInit() {
    bool parametro = validaParametro();
    buttonText = Text(parametro ? "Adicionar": "Atualizar");
    if (!parametro) {
      pesoC.text = priority!.weight.toString();
      nomeC.text = priority!.nome;
    }
    super.onInit();
  }

  bool validaParametro() => priority == null ? true : false;

  void criarAtualizarStatus() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      priority == null ? saveItem(PriorityModel(nome: nomeC.text, weight: int.parse(pesoC.text))) : null;
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
      snackSucessRegister(Get.context!, 'Prioridade ${nomeC.text} registrado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(Get.context!, error);
      });                    
    } 
  }

}
