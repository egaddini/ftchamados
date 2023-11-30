import 'package:chamados/app/modules/call_settings/call_settings_screen.dart';
import 'package:chamados/app/modules/user_settings/user_settings_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {

  final List<Widget> screens = [
    const CallSettingsForm(),
    const UsersSettingsForm(),
  ];

  RxInt selectedIndex = 0.obs;

  void setIndex(int index) => selectedIndex.value = index;

}