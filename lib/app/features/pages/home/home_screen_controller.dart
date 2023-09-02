part of home_screen;

class HomeScreenController extends GetxController {

  RxBool isHovered = false.obs, isLoading = true.obs;
  RxList<CallCategoryModel> items = <CallCategoryModel>[].obs;
  CallCategoryRepository callRepo = CallCategoryRepository();
  late UserInfoModel? logedUser;

  @override
  Future<void> onInit() async {
    items.addAll(await callRepo.getList());
    logedUser = await LocalStorageServices().getUser();
    logedUser == null ? Get.offAndToNamed(AppRoutes.login) : isLoading.value = false;
    super.onInit();
  }

  Widget drawer() => MenuDrawer(user: logedUser!);

}