import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chamados/app/modules/login/login_repository.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../routes/app_pages.dart';
import '../../data/models/login_model.dart';
import '../../data/services/app_config/service.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  late AppConfigService config;
  final LoginRepository loginRepository;

  LoginScreenController({required this.loginRepository,});

  @override
  void onInit() {
    config = Get.find<AppConfigService>();
    super.onInit();
  }

  login() async {
    isLoading.value = true;
    await loginRepository.login(LoginModel(email: emailEC.text, password: passwordEC.text)).then((value) {
      config.changeUserData(value.toJson());
      config.changeIsLogged(true);
      Get.offAndToNamed(AppRoutes.home);
    }).catchError((error) {
      isLoading.value = false;
      tratar(error);
    });
  }

}
