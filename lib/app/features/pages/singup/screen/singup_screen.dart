library singup_screen;

import 'package:chamados/app/models/user_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/shared_components/c_password_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:chamados/app/utils/repositories/auth/auth_repository.dart';
import 'package:chamados/app/utils/repositories/auth/auth_repository_impl.dart';
import 'package:chamados/app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part '../components/singup_form.dart';

class SingupScreen extends StatelessWidget {

  const SingupScreen({ Key? key }) : super(key: key);

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
                child: SingupForm()
              ),
            ],
          ),
        ),
      ),
    );
  }
}