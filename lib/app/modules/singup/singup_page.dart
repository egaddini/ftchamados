library singup_screen;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'package:chamados/app/modules/singup/singup_controller.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:chamados/core/utils/masks.dart';
import 'package:chamados/core/utils/validators/validators.dart';

import '../../widgets/c_password_field.dart';
import '../../widgets/c_text_form_field.dart';
import '../../widgets/custom_card/custom_card.dart';

class SingupPage extends GetView<SingUpController> {
  const SingupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomCard.customCard(
            width: 400,
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Text(
                      'Crie sua conta',
                      style: Get.theme.textTheme.displaySmall,
                    ),
                    addVerticalSpace(50),
                    TextFormField(
                      controller: controller.nameEC,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      validator: Validatorless.required('Nome Obrigatório'),
                    ),
                    addVerticalSpace(10),
                    TextFormField(
                      controller: controller.surnameEC,
                      decoration: const InputDecoration(
                        labelText: 'Sobrenome',
                      ),
                      validator:
                          Validatorless.required('Sobrenome Obrigatório'),
                    ),
                    addVerticalSpace(10),
                    CustomTextFormField(
                        controller: controller.emailEC,
                        labelText: 'Email',
                        validator: [
                          Validatorless.required('Email obrigatório'),
                          Validatorless.email('Email invalido'),
                        ]),
                    addVerticalSpace(10),
                    TextFormField(
                      controller: controller.phoneEC,
                      inputFormatters: [Masks.getPhoneFormater()],
                      decoration: const InputDecoration(
                        labelText: 'Telefone',
                      ),
                      validator: Validatorless.required('Telefone Obrigatório'),
                    ),
                    addVerticalSpace(10),
                    PasswordField(
                        labelText: "Senha",
                        controller: controller.passwordEC,
                        validator: [
                          Validatorless.required('Confirmar senha obrigatória'),
                          Validatorless.min(6,
                              'Confirmar senha precisa ter no mínimo 6 caracteres'),
                        ]),
                    addVerticalSpace(10),
                    PasswordField(
                        labelText: 'Confirmar Senha',
                        controller: controller.confirmPasswordEC,
                        validator: [
                          Validatorless.required('Confirmar senha obrigatória'),
                          Validatorless.min(6,
                              'Confirmar senha precisa ter no mínimo 6 caracteres'),
                          Validators.compare(
                              controller.passwordEC, 'Senhas não conferem'),
                        ]),
                    addVerticalSpace(15),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            'Voltar e entrar',
                          ),
                        ),
                        FilledButton(
                          child: const Text('Avançar'),
                          onPressed: () => controller.singup(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}
