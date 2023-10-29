part of home_screen;

class HomeController extends GetxController with StateMixin<CallCategoryModel> {

  RxList<CallCategoryModel> itens = <CallCategoryModel>[].obs;
  CallCategoryRepository callRepo = CallCategoryRepository();
  late UserInfoModel? logedUser;
  
  RxInt current = 0.obs;
  final CarouselController carouselC = CarouselController();
  RxList<Widget> imgList = <Widget>[].obs;

  final TextEditingController aheadController = TextEditingController();

  late AppConfigService _appConfigService;

  @override
  void onInit() async {
    _appConfigService = Get.find<AppConfigService>();
    logedUser = UserInfoModel.fromJson(_appConfigService.userData());

    await callRepo.getList().then((value) => {
      itens = value.obs,
      imgList.addAll(value.map((element) => CarrouselCardWidget(call: element)).toList()),
    });

    change(null, status: RxStatus.success());
    super.onInit();
  }

  setCarousel(int index) => current.value = index;

  
  DropdownMenuItem toDropdownMenuItem(MenuItem item) {
    return DropdownMenuItem<MenuItem>(
      value: item,
      child: Row(
        children: [
          Icon(item.icon, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          CustomExpandedTextField(
            controller: TextEditingController(),
            labelText: 'Ihul',
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
