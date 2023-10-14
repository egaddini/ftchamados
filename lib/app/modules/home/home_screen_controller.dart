part of home_screen;

class HomeScreenController extends GetxController
    with StateMixin<CallCategoryModel> {
  RxBool isHovered = false.obs, isLoading = true.obs;
  RxList<CallCategoryModel> itens = <CallCategoryModel>[].obs;
  CallCategoryRepository callRepo = CallCategoryRepository();
  late UserInfoModel? logedUser;
  RxInt current = 0.obs;
  final CarouselController carouselC = CarouselController();

  RxList<Widget> imgList = <Widget>[].obs;

  late AppConfigService _appConfigService;

  @override
  void onInit() async {
    _appConfigService = Get.find<AppConfigService>();
    logedUser = UserInfoModel.fromJson(_appConfigService.userData());

    await callRepo.getList().then((value) => {
          itens = value.obs,
          imgList.addAll(value
              .map((element) => CarrouselCardWidget(call: element))
              .toList()),
        });

    change(null, status: RxStatus.success());
    super.onInit();
  }

  setCarousel(int index) => current.value = index;
}
