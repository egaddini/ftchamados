import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/modules/login/auth_repository.dart';

import '../../../core/utils/helper.dart';
import '../../../routes/app_pages.dart';
import '../../data/models/user_model.dart';

class SingUpController extends GetxController with StateMixin<UserModel> {
  late AuthRepository authRepository;

  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final surnameEC = TextEditingController();
  final usernameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void onInit() {
    authRepository = Get.find<AuthRepository>();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  singup() {
    change(null, status: RxStatus.loading());
    if (formKey.currentState?.validate() ?? false) {
      UserModel userModel = UserModel(
        firstname: nameEC.text,
        lastname: surnameEC.text,
        phone: int.parse(GetUtils.numericOnly(phoneEC.text)),
        email: emailEC.text,
        password: passwordEC.text,
        sectors: [],
      );
      authRepository.register(userModel).then((_) {
        snackSucessRegister('Conta registrada com sucesso!',
            'Sua solicitação será revisada e conta habilitada em até 2 dias úteis.');
        Get.offAndToNamed(AppRoutes.login);
      }).catchError((error) {
        tratarErro(error);
      });
    }
    change(null, status: RxStatus.success());
  }
}
