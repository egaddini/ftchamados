part of home_screen;

class MenuDrawerController extends GetxController {

  late UserInfoModel logedUser;
  RxBool isLoading = true.obs, isAdmin = false.obs;
  RxInt notificacoes = 0.obs; 
  RxDouble currentAccountPictureSize = 70.00.obs;
  Rx<Widget> themeData = cInkWell(50, 55, Icons.dark_mode, Icons.dark_mode_outlined, Get.theme.colorScheme.primary , null, 'Dark Mode', () => {Get.changeThemeMode(ThemeMode.dark), print('object'),}).obs;

  @override
  Future<void> onInit() async {
    logedUser = (await LocalStorageServices().getUser())!;
    isAdmin.value = logedUser.isAdmin();
    isLoading.value = false;
    super.onInit(); 
  }

}