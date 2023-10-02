import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/repositories/call/call/call_repository.dart';
import 'package:chamados/app/repositories/call/call/call_repository_impl.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.controller.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';

class CallRequesterDashboardController extends CustomPaginatedDataTable2Controller<Call> {

  bool sort = true;
  final CallRepository _callRepo = CallRepositoryImpl();

  @override
  void onInit() {
    LocalStorageServices().getUser().then((value) => {
      _callRepo.getCallListByEmail(value!.email!).then((value) => {
        data.value = value,
        isLoading.value = false,
      },),
    });
    super.onInit();
  }

}