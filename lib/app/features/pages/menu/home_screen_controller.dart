part of home_screen;

class HomeScreenController extends GetxController {

  RxBool isHovered = false.obs, isLoading = true.obs;
  RxList<CallCategoryModel> items = <CallCategoryModel>[].obs;

  CallCategoryRepository callRepo = CallCategoryRepository();

  @override
  Future<void> onInit() async {
    items.addAll(await callRepo.getList());
    isLoading.value = false;
    super.onInit();
  }

}