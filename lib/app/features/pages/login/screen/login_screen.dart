library login_screen;

import 'package:chamados/app/config/routes/app_pages.dart';
import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/login_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/shared_components/c_password_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:chamados/app/utils/repositories/auth/auth_repository.dart';
import 'package:chamados/app/utils/repositories/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

part '../components/login_form.dart';
part '../components/login_form_controller.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body:Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: LoginForm()
              ),
            ],
          ),
        ),
      ),
    );
  }
}