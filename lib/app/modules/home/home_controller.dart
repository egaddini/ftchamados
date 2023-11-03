part of home_screen;

class HomeController extends GetxController with StateMixin<CallCategoryModel> {

  RxList<CallCategoryModel> itens = <CallCategoryModel>[].obs;
  CallCategoryRepository callRepo = CallCategoryRepository();
  late UserInfoModel? logedUser;
  
  RxInt current = 0.obs;
  final CarouselController carouselC = CarouselController();
  RxList<Widget> imgList = <Widget>[].obs;

  RxList selectedItems = [].obs;

  late DateTime? selectedDate = DateTime.now();

  final TextEditingController aheadController = TextEditingController();

  late AppConfigService _appConfigService;

  List<String> statos = [
    'Aberto',
    'Em Triagem',
    'Em Andamento',
    'Aguardando Informações',
    'Aguardando Aprovação',
    'Em Espera',
    'Pendente',
    'Resolvido com Falha',
    'Cancelado',
    'Finalizado'
  ];

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

  
  newCall(CallCategoryModel call) => 
    Get.dialog( 
      NewCallForm(
        controller: Get.put<NewCallController>(NewCallController(callCategory: call, callRepo: Get.put(CallRepository())),)
      ),
    ).then((value) => Get.delete<NewCallController>());
  
  filter() {
    return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        titlePadding: const EdgeInsets.only(top: 10),
        contentPadding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        title: AppBar(
          title: const Text('Busca Aprimorada'),
          forceMaterialTransparency: true,
        ),
        content: const SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: CallSectorDropdownPage(),
              ),
            ],
          )
        ),
        actionsPadding: const EdgeInsets.symmetric(vertical: 8),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(onPressed: () {}, child: const Text('Filtrar'))
        ],
      ),
    );
  }


}
