part of home_screen;

class MenuDrawerController extends GetxController {

  late UserInfoModel logedUser;
  RxBool isLoading = true.obs, isAdmin = false.obs;
  RxInt notificacoes = 0.obs; 
  RxDouble currentAccountPictureSize = 70.00.obs;

  @override
  Future<void> onInit() async {
    logedUser = (await LocalStorageServices().getUser())!;
    isAdmin.value = logedUser.isAdmin();
    isLoading.value = false;
    super.onInit(); 
  }

}