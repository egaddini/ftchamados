// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/models/call_dto.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/repositories/call/call/call_repository.dart';
import 'package:chamados/app/repositories/call/call/call_repository_impl.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';

class NewCallController extends GetxController {
  
  CallCategoryModel callCategory;

  RxBool isLoading = false.obs;

  TextEditingController descreverProblemaC = TextEditingController(text: '');
  TextEditingController? emailUsuarioC = TextEditingController();
  final TextEditingController dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now()));
  final CallRepository callRepo = CallRepositoryImpl();
  
  late UserInfoModel? logedUser;
  
  NewCallController({
    required this.callCategory,
  });


  @override
  void onInit() async {
    logedUser = await LocalStorageServices().getUser();
    emailUsuarioC!.text =  logedUser!.email!;
    super.onInit();
  }


  void onClickNewCall() {
    isLoading.value = true;
    CallDTO call = CallDTO(solicitante: logedUser!.id!, callType: callCategory.id!, descricao: descreverProblemaC.text);
    callRepo.register(call).then((_) {
      Get.back();
      snackSucessRegister('Chamado registrado com sucesso!');
    }).catchError((error) {
      isLoading.value = false;
      tratarErro(error);
    });              
  }

}
