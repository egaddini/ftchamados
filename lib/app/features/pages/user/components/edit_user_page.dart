library edit_user_page;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/c_appbar.dart';
import 'package:chamados/app/shared_components/c_password_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/services/user_service.dart';
import 'package:chamados/app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

part '../components/edit_user_components.dart';

class EditUserPage extends StatefulWidget {
  final UserInfoModel _client;
  
  EditUserPage(this._client);
  @override
  State<StatefulWidget> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: widget._client.email),
      body: EditUserPageBody(widget._client),
    );
  }
}