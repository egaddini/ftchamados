import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/modules/login/auth_repository.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../routes/app_pages.dart';
import '../../data/models/login_model.dart';
import '../../data/services/app_config/service.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  late AuthRepository authRepository;
  late AppConfigService config;

  @override
  void onInit() {
    authRepository = Get.find<AuthRepository>();
    config = Get.find<AppConfigService>();
    super.onInit();
  }

  void onClickContinuar() {
    if (formKey.currentState?.validate() ?? false) {
      LoginModel loginModel = LoginModel(email: emailEC.text, password: passwordEC.text);
      isLoading.value = true;
      authRepository.authenticate(loginModel).then((modelResponse) {
        config.changeUserData(modelResponse.toJson());
        Get.offAndToNamed(AppRoutes.home);
      }).catchError((error) {
        isLoading.value = false;
        tratarErro(error);
      });
    }
  }
}
