import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/modules/user/user_repository.dart';
import 'package:chamados/app/widgets/custom_data_table/custom_paginated_data_table2.controller.dart';
import 'package:chamados/app/widgets/custom_ink_well/c2_inkwell.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/core/utils/helper.dart';

class UserController extends CustomPaginatedDataTable2Controller<UserInfoModel> with StateMixin<List<dynamic>> {
  
  final UserRepository userRepository;

  bool sort = true;
  List<UserInfoModel> filterData = [];

  UserController(this.userRepository);

  @override
  void onInit() {
    refreshUserList();
    super.onInit();
  }

  void refreshUserList() {
    userRepository.getUsers().then((response) {
      change(response, status: RxStatus.success());
      data.value = response.map((json) => UserInfoModel.fromMap(json)).toList();
      isLoading.value = false;
    }).catchError((error) {
      tratarErro(error);
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  onsortColum(int columnIndex, bool ascending) {
    sort = !sort;
    if (columnIndex == 2) {
      if (ascending) {
        data.sort((a, b) => a.email!.compareTo(b.email!));
      } else {
        data.sort((a, b) => b.email!.compareTo(a.email!));
      }
    }
  }

  void removeUser(UserInfoModel user) {
    showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        titlePadding: const EdgeInsets.all(8),
        title: AppBar(title: const Text("Remover Cliente"), forceMaterialTransparency: true),
        content: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [ 
            Text( "O usuário: ${user.email ?? "?"} será removido para sempre, deseja realmente continuar?")
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CInkWell(defaultIcon: Icons.delete, defaultColor: Get.theme.primaryColor, function: 
            () => {
              userRepository.removeUser(user.id!).then((_) {
                refreshUserList();
                Get.back();
                snackSucessRegister('Usuário removido com sucesso!', 'O usuário: ${user.email ?? "?"} foi removido.');
              }).catchError((error) {
                Get.back();
                tratarErro(error);
              }),
            },
          ),
        ],
      )
    );
  }
}
