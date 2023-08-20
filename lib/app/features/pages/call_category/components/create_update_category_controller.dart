import 'package:chamados/app/models/call_category_model_.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/call/call_category/call_category_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateCategoryController extends GetxController {

  final CallCategoryModel? category;
  final CallCategoryRepository categoryRep = CallCategoryRepository();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nomeC = TextEditingController();
  RxBool isLoading = false.obs;
  TextEditingController pesoC = TextEditingController();
  late Text buttonText;

  CreateUpdateCategoryController({this.category,});
  
  @override
  void onInit() {
    bool parametro = validaParametro();
    buttonText = Text(parametro ? "Adicionar": "Atualizar");
    if (!parametro) {
      // pesoC.text = category!.weight.toString();
      // nomeC.text = category!.nome;
    }
    super.onInit();
  }

  bool validaParametro() => category == null ? true : false;

  void criarAtualizarStatus() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      // category == null ? saveItem(CallCategoryModel(nome: nomeC.text, weight: int.parse(pesoC.text))) : null;
      // saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value)):
      // saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value));
    }
  }

  void saveItem(CallCategoryModel category) async {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      isLoading.value = false;
      categoryRep.register(category).then((_) {
      Get.back();
      snackSucessRegister(Get.context!, 'Prioridade ${nomeC.text} registrado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(Get.context!, error);
      });                    
    } 
  }

}
