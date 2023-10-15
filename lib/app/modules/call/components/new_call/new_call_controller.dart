import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../../../data/models/call_category_model.dart';
import '../../../../data/models/call_dto.dart';
import '../../../../data/models/user_info_model.dart';
import '../../call_repository_impl.dart';

class NewCallController extends GetxController {
  
  final CallCategoryModel callCategory;

  TextEditingController descreverProblemaC = TextEditingController(text: '');

  TextEditingController? emailUsuarioC = TextEditingController();

  final TextEditingController dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now()));

  late CallRepository callRepo;

  late UserInfoModel logedUser;

  NewCallController({required this.callCategory});


  @override
  void onInit() {
    logedUser = UserInfoModel.fromJson(AppConfigService().instance().userData());
    emailUsuarioC!.text = logedUser.email!;
    super.onInit();
  }

  void onClickNewCall() {
    CallDTO call = CallDTO(
        solicitante: logedUser.id!,
        callType: callCategory.id!,
        descricao: descreverProblemaC.text);
    callRepo.register(call).then((_) {
      Get.back();
      snackSucessRegister('Registrado com sucesso', 'Chamado registrado com sucesso!');
    }).catchError((error) {
      tratarErro(error);
    });
  }
}
