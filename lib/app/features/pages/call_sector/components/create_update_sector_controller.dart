import 'package:chamados/app/models/setor_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/call/setor/setor_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateSectorController extends GetxController {

  final SectorModel? sector;
  final SetorRepository setorRep = SetorRepository();
  final formKey = GlobalKey<FormState>();
  final TextEditingController siglaC = TextEditingController();
  final TextEditingController nomeC = TextEditingController();
  RxBool isLoading = false.obs;
  late Text buttonText;

  CreateUpdateSectorController({this.sector,});
  
  @override
  void onInit() {
    bool parametro = validaParametro();
    buttonText = Text(parametro ? "Adicionar": "Atualizar");
    if (!parametro) {
      siglaC.text = sector!.sigla;
      nomeC.text = sector!.nome;
    }
    super.onInit();
  }

  bool validaParametro() => sector == null ? true : false;

  void criarAtualizarStatus() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      sector == null ? saveItem(SectorModel(nome: nomeC.text, sigla: siglaC.text.toUpperCase())) : null;
      // saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value)):
      // saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value));
    }
  }

  void saveItem(SectorModel sector) async {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      isLoading.value = false;
      setorRep.register(sector).then((_) {
      Get.back();
      snackSucessRegister(Get.context!, 'Setor ${nomeC.text} registrado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(Get.context!, error);
      });                    
    } 
  }

}
