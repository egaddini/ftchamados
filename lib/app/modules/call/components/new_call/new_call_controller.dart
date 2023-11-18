// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../../data/models/call_category_model.dart';
import '../../../../data/models/call_dto.dart';
import '../../../../data/models/user_info_model.dart';
import '../../call_repository.dart';

class NewCallController extends GetxController {

  late UserInfoModel logedUser;
  TextEditingController descreverProblemaC = TextEditingController(text: '');

  final CallCategoryModel callCategory;
  final CallRepository callRepo;

  NewCallController({
    required this.callCategory,
    required this.callRepo,
  });


  @override
  void onInit() {
    logedUser = AppConfigService().to().userData();
    super.onInit();
  }

  void onClickNewCall() {
    CallDTO call = CallDTO(
      solicitante: logedUser.id!,
      callType: callCategory.id!,
      descricao: descreverProblemaC.text
    );
    callRepo.register(call).then((_) {
      Get.back();
      snackSucessRegister('Registrado com sucesso', 'Chamado registrado com sucesso!');
    }).catchError((error) {
      tratarErro(error);
    });
  }
}
