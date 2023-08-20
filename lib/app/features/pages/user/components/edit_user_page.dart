library edit_user_page;

import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/c_password_field.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/user/user_repository.dart';
import 'package:chamados/app/repositories/user/user_repository_impl.dart';
import 'package:chamados/app/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../utils/services/local_storage/local_storage.dart';

part '../components/edit_user_components.dart';

class EditUserPage extends StatefulWidget {
  final UserInfoModel _client;
  
  const EditUserPage(this._client, {super.key});
  @override
  State<StatefulWidget> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._client.email.toString())),
      body: EditUserPageBody(widget._client),
    );
  }
}