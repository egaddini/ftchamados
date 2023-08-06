part of home_screen;

class MenuDrawerController extends GetxController {

  late UserInfoModel logedUser;
  RxBool isLoading = true.obs, isAdmin = false.obs, isLight = false.obs;
  RxInt notificacoes = 0.obs; 
  RxDouble currentAccountPictureSize = 70.00.obs;

  late Rx<Widget> themeInk = darkModeInk.obs;

  late Widget lightModeInk = cInkWell(50, 55, Icons.light_mode, Icons.light_mode_outlined, Get.theme.colorScheme.inversePrimary , null, 'Light Mode', () {
    themeInk.value = darkModeInk;
    Get.changeThemeMode(ThemeMode.light);
    Get.changeTheme(lightTheme);
    },
  );
  late Widget darkModeInk = cInkWell(50, 55, Icons.dark_mode, Icons.dark_mode_outlined, Get.theme.colorScheme.primary , null, 'Dark Mode', () {
    themeInk.value = lightModeInk;
    Get.changeThemeMode(ThemeMode.dark);
    Get.changeTheme(darkTheme);
    },
  );

  @override
  Future<void> onInit() async {
    logedUser = (await LocalStorageServices().getUser())!;
    isAdmin.value = logedUser.isAdmin();
    isLoading.value = false;
    super.onInit(); 
  }

}