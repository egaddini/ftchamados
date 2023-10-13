library singup_screen;

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

import 'package:chamados/core/utils/helper.dart';
import 'package:chamados/core/utils/validators/validators.dart';

import '../../../../routes/app_pages.dart';
import '../../../data/models/user_model.dart';
import '../../../widgets/c_password_field.dart';
import '../../../widgets/c_text_form_field.dart';
import '../../login/auth_repository.dart';
import '../../login/auth_repository.dart';

part '../components/singup_form.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(width: 400, child: SingupForm()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
