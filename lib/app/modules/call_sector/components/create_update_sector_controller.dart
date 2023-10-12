import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/modules/call_sector/setor_repository.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../data/models/sector_model.dart';

class CreateUpdateSectorController extends GetxController {
  final SectorModel? sector;
  final SectorRepository setorRep = SectorRepository();
  final formKey = GlobalKey<FormState>();
  final TextEditingController siglaC = TextEditingController();
  final TextEditingController nomeC = TextEditingController();
  RxBool isLoading = false.obs;
  late Text buttonText;

  CreateUpdateSectorController({
    this.sector,
  });

  @override
  void onInit() {
    bool parametro = validaParametro();
    buttonText = Text(parametro ? "Adicionar" : "Atualizar");
    if (!parametro) {
      siglaC.text = sector!.acronym;
      nomeC.text = sector!.name;
    }
    super.onInit();
  }

  bool validaParametro() => sector == null ? true : false;

  void criarAtualizarStatus() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      sector == null
          ? saveItem(
              SectorModel(name: nomeC.text, acronym: siglaC.text.toUpperCase()))
          : null;
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
        snackSucessRegister('Registrado com sucesso',
            'Setor ${nomeC.text} registrado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(error);
      });
    }
  }
}
