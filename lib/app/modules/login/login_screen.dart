library login_screen;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'package:chamados/app/widgets/custom_card/custom_card.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/c_password_field.dart';
import '../../widgets/c_text_form_field.dart';
import 'login_screen_controller.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCard.customCard(
              width: 400,
              content: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Olá Novamente',
                        style: Get.theme.textTheme.displaySmall,
                      ),
                      addVerticalSpace(30),
                      CustomTextFormField(
                          controller: controller.emailEC,
                          labelText: 'Email',
                          validator: [
                            Validatorless.required('Email obrigatório'),
                            Validatorless.email('Email inválido'),
                          ]),
                      addVerticalSpace(20),
                      PasswordField(
                          labelText: "Senha",
                          controller: controller.passwordEC,
                          validator: [
                            Validatorless.required('Confirmar senha obrigatória'),
                            Validatorless.min(6,'Confirmar senha precisa ter no mínimo 6 caracteres'),
                          ]),
                      addVerticalSpace(20),
                      Column(
                        children: [
                          FilledButton(
                            child: const Text(
                              'Continuar',
                            ),
                            onPressed: () => controller.login(),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Não tem uma conta?'),
                          TextButton(
                            onPressed: () => Get.toNamed(AppRoutes.singup),
                            child: const Text('Entre aqui'),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'OU',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(410, 65),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                              side: const BorderSide(color: Color(0xFFBDBDBD)),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.g_mobiledata_outlined,
                              color: Get.theme.primaryColor,
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              'Entrar com o Google',
                              style: TextStyle(fontSize: 16, color: Get.theme.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
