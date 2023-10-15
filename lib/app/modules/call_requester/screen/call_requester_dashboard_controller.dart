// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/data/models/user_info_model.dart';

import '../../../data/models/call.dart';
import '../../../data/services/app_config/service.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.controller.dart';
import '../../call/call_repository_impl.dart';

class CallRequesterDashboardController extends CustomPaginatedDataTable2Controller<Call> {
  
  bool sort = true;

  final CallRepository callRepo;
  CallRequesterDashboardController({
    required this.callRepo,
  });

  @override
  void onInit() {
    UserInfoModel.fromJson(AppConfigService().to().userData()).email;
      callRepo.getCallListByEmail(UserInfoModel.fromJson(AppConfigService().to().userData()).email!).then((value) => {
        data.value = value,
        isLoading.value = false,
      });
    super.onInit();
  }
}
