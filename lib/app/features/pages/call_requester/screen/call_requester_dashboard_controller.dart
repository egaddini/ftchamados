import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/repositories/call/call/call_repository.dart';
import 'package:chamados/app/repositories/call/call/call_repository_impl.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallRequesterDashboardController extends GetxController {

  bool sort = true;
  RxBool isLoading = true.obs;
  RxList<Call> myData = <Call>[].obs;
  final CallRepository _callRepo = CallRepositoryImpl();

  TextEditingController controller = TextEditingController();

  @override
  void onInit() {
    LocalStorageServices().getUser().then((value) => {
      _callRepo.getCallListByEmail(value!.email!).then((value) => myData.addAll(value)),
      myData.refresh(),
      setLoading(),
    }).catchError((error) => {
        setLoading(),
        tratarErro(error),
    }); 
    super.onInit();
  }

  setLoading() => isLoading.value = !isLoading.value;

}