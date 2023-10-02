import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.controller.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/category/call_category_repository.dart';
import 'package:get/get.dart';

class CallCategoryController extends CustomPaginatedDataTable2Controller<CallCategoryModel> {
  
  bool sort = true;
  final CallCategoryRepository _callCategoryRepository;

  CallCategoryController(this._callCategoryRepository);

  @override
  void onInit() async {
    _callCategoryRepository.getList().then((value) => {
      data.value = value,
      isLoading.value = false,
    });
    super.onInit();
  }

  void deleteItem(int index) async {
    CallCategoryModel category = data[index];
    bool? deleta = await perguntaSimOuNao('Deseja remover a Categoria: ${category.description}');
    if (deleta != null && deleta) {
      _callCategoryRepository.delete(category.id!).then((_) {
        data.removeAt(index);
        Get.back();
        snackSucessRegister('Registrado com sucesso', 'Categoria ${category.description} Deletado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(error);
      }); 
    }
  }

  Future<bool> atualizarItens() async {
    await Future.delayed(const Duration(milliseconds: 500));
    data.value = await _callCategoryRepository.getList();
    data.refresh();
    return true;
  }

}