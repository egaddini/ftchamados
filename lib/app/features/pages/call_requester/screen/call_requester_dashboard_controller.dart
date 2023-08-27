import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/repositories/call/call/call_repository.dart';
import 'package:chamados/app/repositories/call/call/call_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallRequesterDashboardController extends GetxController {

  bool sort = true;
  bool isLoading = true;
  List<Call> filterData = [], myData = [];
  final CallRepository _callRepo = CallRepositoryImpl();
  late UserInfoModel? logedUser;

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData.sort((a, b) => a.solicitante!.email.toString().compareTo(b.solicitante!.email.toString()));
      } else {
        filterData.sort((a, b) => b.solicitante!.email.toString().compareTo(a.solicitante!.email.toString()));
      }
    }
  }

  TextEditingController controller = TextEditingController();
}