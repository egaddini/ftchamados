import 'package:chamados/app/models/setor_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/call/setor/setor_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallSectorController extends GetxController {
  
  bool sort = true;
  RxBool isLoading = true.obs;
  TextEditingController formFieldC = TextEditingController();
  RxList<SectorModel> myData = <SectorModel>[].obs;
  final SetorRepository _sectorRepository;

  CallSectorController(this._sectorRepository);

  @override
  void onInit() async {
    myData.addAll(await _sectorRepository.getList());
    isLoading = false.obs;
    super.onInit();
  }

  void deleteItem(int index) async {
    SectorModel data = myData[index];
    bool? deleta = await perguntaSimOuNao('Deseja remover o Status: ${data.nome}');
    if (deleta != null && deleta) {
      _sectorRepository.delete(data.id!).then((_) {
        myData.removeAt(index);
        Get.back();
        snackSucessRegister(Get.context!, 'Status ${data.nome} Deletado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(Get.context!, error);
      }); 
    }
  }

}