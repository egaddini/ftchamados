import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/repositories/call/call/call_repository.dart';
import 'package:chamados/app/repositories/call/call/call_repository_impl.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallRequesterDashboardController extends GetxController {

  bool sort = true;
  RxBool isLoading = true.obs;
  RxList<Call> myData = <Call>[].obs;
  final CallRepository _callRepo = CallRepositoryImpl();
  late UserInfoModel logedUser;

  TextEditingController controller = TextEditingController();

  @override
  void onInit() async {
    logedUser = (await LocalStorageServices().getUser())!;
    myData = (await _callRepo.getCallListByEmail(logedUser.email!)).obs;
    isLoading.value = false;
    super.onInit();
  }


}