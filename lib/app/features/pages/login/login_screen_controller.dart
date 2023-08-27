

import 'package:chamados/app/config/routes/app_pages.dart';
import 'package:chamados/app/models/login_model.dart';
import 'package:chamados/app/repositories/auth/auth_repository.dart';
import 'package:chamados/app/repositories/auth/auth_repository_impl.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {

  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  
  final AuthRepository authRepository = AuthRepositoryImpl();

  void onClickContinuar() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      LoginModel loginModel = LoginModel(email: emailEC.text, password: passwordEC.text);
      isLoading.value = true;
      authRepository.authenticate(loginModel).then((_) {
        Get.offAndToNamed(AppRoutes.home);
      }).catchError((error) {
        isLoading.value = false;
        tratarErro(Get.context!, error);
      }); 
    } 
  }
  
}