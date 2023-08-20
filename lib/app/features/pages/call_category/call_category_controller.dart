import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/call_category/call_category_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallCategoryController extends GetxController {
  
  bool sort = true;
  RxBool isLoading = true.obs;
  TextEditingController formFieldC = TextEditingController();
  RxList<CallCategoryModel> myData = <CallCategoryModel>[].obs;
  final CallCategoryRepository _callCategoryRepository;

  CallCategoryController(this._callCategoryRepository);

  @override
  void onInit() async {
    myData.addAll(await _callCategoryRepository.getList());
    isLoading = false.obs;
    super.onInit();
  }

  void deleteItem(int index) async {
    CallCategoryModel data = myData[index];
    bool? deleta = await perguntaSimOuNao('Deseja remover a Categoria: ${data.descricao}');
    if (deleta != null && deleta) {
      _callCategoryRepository.delete(data.id!).then((_) {
        myData.removeAt(index);
        Get.back();
        snackSucessRegister(Get.context!, 'Categoria ${data.descricao} Deletado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(Get.context!, error);
      }); 
    }
  }

}