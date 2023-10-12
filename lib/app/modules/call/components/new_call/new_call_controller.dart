import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../../../data/models/call_category_model.dart';
import '../../../../data/models/call_dto.dart';
import '../../../../data/models/user_info_model.dart';
import '../../../../data/providers/local_storage/local_storage.dart';
import '../../call_repository.dart';
import '../../call_repository_impl.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class NewCallController extends GetxController {
  CallCategoryModel callCategory;

  RxBool isLoading = false.obs;

  TextEditingController descreverProblemaC = TextEditingController(text: '');
  TextEditingController? emailUsuarioC = TextEditingController();
  final TextEditingController dataAberturaC = TextEditingController(
      text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now()));
  final CallRepository callRepo = CallRepositoryImpl();

  late UserInfoModel? logedUser;

  NewCallController({
    required this.callCategory,
  });

  @override
  void onInit() async {
    logedUser = await LocalStorageServices().getUser();
    emailUsuarioC!.text = logedUser!.email!;
    super.onInit();
  }

  void onClickNewCall() {
    isLoading.value = true;
    CallDTO call = CallDTO(
        solicitante: logedUser!.id!,
        callType: callCategory.id!,
        descricao: descreverProblemaC.text);
    callRepo.register(call).then((_) {
      Get.back();
      snackSucessRegister(
          'Registrado com sucesso', 'Chamado registrado com sucesso!');
    }).catchError((error) {
      isLoading.value = false;
      tratarErro(error);
    });
  }
}
