import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../../routes/app_pages.dart';
import '../../data/models/login_model.dart';
import 'auth_repository.dart';
import 'auth_repository_impl.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  final AuthRepository authRepository = AuthRepositoryImpl();

  void onClickContinuar() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      LoginModel loginModel =
          LoginModel(email: emailEC.text, password: passwordEC.text);
      isLoading.value = true;
      authRepository.authenticate(loginModel).then((_) {
        Get.offAndToNamed(AppRoutes.home);
      }).catchError((error) {
        isLoading.value = false;
        tratarErro(error);
      });
    }
  }
}
