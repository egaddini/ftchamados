import 'package:chamados/app/models/call_status_model.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.controller.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/status/call_status_repository.dart';
import 'package:get/get.dart';

class CallStatusController extends CustomPaginatedDataTable2Controller<CallStatusModel> {
  
  bool sort = false;

  final CallStatusRepository _callStatusRepository;

  CallStatusController(this._callStatusRepository);

  @override
  void onInit() {
    isLoading = true.obs;
    _callStatusRepository.getList().then((value) => {
      data.value = value,
      isLoading.value = false
    });
      super.onInit();
  }

  void setValue(int index) {
    data[index].notify = !data[index].notify;
    data.refresh();
  }

  void deleteItem(int index) async {
    CallStatusModel status = data[index];
    bool? deleta = await perguntaSimOuNao('Deseja remover o Status: ${status.name}');
    if (deleta != null && deleta) {
      _callStatusRepository.delete(status.id!).then((_) {
        data.removeAt(index);
        data.refresh();
        snackSucessRegister('Registrado com sucesso', 'Status ${status.name} Deletado com sucesso!');
      }).catchError((error) {
        tratarErro(error);
      }); 
    }
  }

  Future<bool> atualizarItens() async {
    await Future.delayed(const Duration(milliseconds: 500));
    data.value = await _callStatusRepository.getList();
    data.refresh();
    return true;
  }

}