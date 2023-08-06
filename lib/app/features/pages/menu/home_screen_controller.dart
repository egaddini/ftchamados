part of home_screen;

class HomeScreenController extends GetxController {

  RxBool isHovered = false.obs, isLoading = true.obs;
  RxList<CallType> items = <CallType>[].obs;

  CallTypeRepository callRepo = CallTypeRepositoryImpl();

  @override
  Future<void> onInit() async {
    items.addAll(await callRepo.getCallTypeList());
    isLoading.value = false;
    super.onInit();
  }

}