import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/priority/priority_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallPriorityController extends GetxController {
  
  bool sort = true;
  RxBool isLoading = true.obs;
  TextEditingController formFieldC = TextEditingController();
  RxList<PriorityModel> myData = <PriorityModel>[].obs;
  final PriorityRepository _priorityRepository;

  CallPriorityController(this._priorityRepository);

  @override
  void onInit() async {
    myData.addAll(await _priorityRepository.getList());
    isLoading = false.obs;
    super.onInit();
  }

  void deleteItem(int index) async {
    PriorityModel data = myData[index];
    bool? deleta = await perguntaSimOuNao('Deseja remover a prioridade: ${data.nome}');
    if (deleta != null && deleta) {
      _priorityRepository.delete(data.id!).then((_) {
        myData.removeAt(index);
        myData.refresh();
        snackSucessRegister('Registrado com sucesso', 'Prioridade ${data.nome} Deletado com sucesso!');
      }).catchError((error) {
        tratarErro(error);
      }); 
    }
  }

  Future<bool> atualizarItens() async {
    await Future.delayed(const Duration(milliseconds: 500));
    myData.value = await _priorityRepository.getList();
    myData.refresh();
    return true;
  }

}