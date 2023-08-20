import 'package:chamados/app/models/call_status_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/call_status/call_status_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallStatusController extends GetxController {
  
  bool sort = true;
  RxBool isLoading = true.obs;
  TextEditingController formFieldC = TextEditingController();
  RxList<CallStatusModel> myData = <CallStatusModel>[].obs;
  final CallStatusRepository _callStatusRepository;
  final RxList<String> pesos = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'].obs;

  CallStatusController(this._callStatusRepository);

  @override
  void onInit() async {
    myData.addAll(await _callStatusRepository.getList());
    refreshValoresDisponiveis();
    isLoading = false.obs;
    super.onInit();
  }
  
  void refreshValoresDisponiveis() {
    for (var element in myData) {
      pesos.remove(element.weight.toString());
    }
    pesos.refresh();
    myData.refresh();
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
        pesos.add(data.weight.toString());
        myData.removeAt(index);
        refreshValoresDisponiveis();
        Get.back();
        snackSucessRegister(Get.context!, 'Status ${data.name} Deletado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(Get.context!, error);
      }); 
    }
  }

}