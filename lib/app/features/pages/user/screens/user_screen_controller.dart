import 'package:chamados/app/features/pages/user/screens/user_screen_prodvider.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.controller.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreenController extends CustomPaginatedDataTable2Controller<UserInfoModel> with StateMixin<List<dynamic>> {

  final UserScreenProvider _userProvider = UserScreenProvider();

  bool sort = true;
  List<UserInfoModel> filterData = [];

  @override
  void onInit() {
    refreshUserList();
    super.onInit();
  }

  void refreshUserList() {
    _userProvider.getUsers().then((response) {
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
        title: AppBar(title: const Text("Remover Cliente"), forceMaterialTransparency: true,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text("O usuário: ${user.email ?? "?"} será removido para sempre, deseja realmente continuar?"),],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            height: 40,
            width: 40,
            child: cInkWell(22, 30, Icons.delete, Icons.delete_forever_outlined, Get.theme.primaryColor, Colors.red, 'Deletar', 
              () => {
                _userProvider.removeUser(user.id!).then((_) {
                  refreshUserList();
                  Get.back();
                  snackSucessRegister('Usuário removido com sucesso!', 'O usuário: ${user.email ?? "?"} foi removido.');
                }).catchError((error) {
                  Get.back();
                  tratarErro(error);
                }),
              },
            ),
          ),
        ],
      )
    );
  }
}