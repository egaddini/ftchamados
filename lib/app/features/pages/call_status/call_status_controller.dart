import 'package:chamados/app/models/call_status_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/status/call_status_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallStatusController extends GetxController {
  
  bool sort = false;
  RxBool isLoading = true.obs;
  TextEditingController formFieldC = TextEditingController();
  RxList<CallStatusModel> myData = <CallStatusModel>[].obs;
  final CallStatusRepository _callStatusRepository;

  CallStatusController(this._callStatusRepository);

  @override
  void onInit() async {
    isLoading = true.obs;
    atualizarItens();
    super.onInit();
  }

  void setValue(int index) {
    myData[index].notify = !myData[index].notify;
    myData.refresh();
  }

  void deleteItem(int index) async {
    CallStatusModel data = myData[index];
    bool? deleta = await perguntaSimOuNao('Deseja remover o Status: ${data.name}');
    if (deleta != null && deleta) {
      _callStatusRepository.delete(data.id!).then((_) {
        myData.removeAt(index);
        myData.refresh();
        snackSucessRegister(Get.context!, 'Status ${data.name} Deletado com sucesso!');
      }).catchError((error) {
        tratarErro(Get.context!, error);
      }); 
    }
  }

  Future<bool> atualizarItens() async {
    myData.value = await _callStatusRepository.getList();
    myData.refresh();
    return true;
  }

}