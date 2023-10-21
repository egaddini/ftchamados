// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/helper.dart';
import '../../../routes/app_pages.dart';
import '../../data/models/user_model.dart';
import 'singup_repository.dart';

class SingUpController extends GetxController {

  final SingUpRepository singupRepository;

  SingUpController({required this.singupRepository,});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameEC = TextEditingController();
  final surnameEC = TextEditingController();
  final usernameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  singup() async {
    if (formKey.currentState?.validate() ?? false) {
      await singupRepository.singup(
        UserModel(
        firstname: nameEC.text,
        lastname: surnameEC.text,
        phone: int.parse(GetUtils.numericOnly(phoneEC.text)),
        email: emailEC.text,
        password: passwordEC.text,
        sectors: [],
      )).then((value) {
        Get.offAndToNamed(AppRoutes.login);
        snackSucessRegister('Conta registrada com sucesso!','Sua solicitação será revisada e conta habilitada em até 2 dias úteis.');
      }).catchError((error) {
        tratar(error);
      });
    }
  }
  
}
