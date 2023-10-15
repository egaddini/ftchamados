import '../../../data/models/call.dart';
import '../../../data/providers/local_storage/local_storage.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.controller.dart';
import '../../call/call_repository.dart';

class CallSolverDashboardController extends CustomPaginatedDataTable2Controller<Call> {
  bool sort = true;
  late  CallRepository _callRepo;

  @override
  void onInit() {
    LocalStorageServices().getUser().then((value) => {
          _callRepo.getCallList().then(
                (value) => {
                  data.value = value,
                  isLoading.value = false,
                },
              ),
        });
    super.onInit();
  }
}
