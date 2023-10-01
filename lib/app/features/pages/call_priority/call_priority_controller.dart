import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.controller.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/priority/priority_repository.dart';
import 'package:get/get.dart';

class CallPriorityController extends CustomPaginatedDataTable2Controller<PriorityModel> {
  
  bool sort = true;
  final PriorityRepository repository;

  CallPriorityController(this.repository);

  @override
  void onInit() async {
    repository.getList().then((value) => {
      data.value = value,
      isLoading = false.obs,
    });
    super.onInit();
  }

  void deleteItem(int index) async {
    PriorityModel priority = data[index];
    bool? deleta = await perguntaSimOuNao('Deseja remover a prioridade: ${priority.name}');
    if (deleta != null && deleta) {
      repository.delete(priority.id!).then((_) {
        data.removeAt(index);
        data.refresh();
        snackSucessRegister('Registrado com sucesso', 'Prioridade ${priority.name} Deletado com sucesso!');
      }).catchError((error) {
        tratarErro(error);
      }); 
    }
  }

  Future<bool> atualizarItens() async {
    await Future.delayed(const Duration(milliseconds: 500));
    data.value = await repository.getList();
    data.refresh();
    return true;
  }

}