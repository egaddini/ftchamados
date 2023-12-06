part of 'home_page.dart';

class HomeController extends GetxController with StateMixin<CallCategoryModel> {

  RxList<CallCategoryModel> itens = <CallCategoryModel>[].obs;
  RxList<PriorityModel> selectedPrioritys = <PriorityModel>[].obs;
  RxList<SectorModel> selectedSectors = <SectorModel>[].obs;

  final TextEditingController aheadController = TextEditingController();

  final HomeRepository repository;

  HomeController(this.repository);

  @override
  void onInit() async {
    await findAll();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  findAll() async {
    return await repository.findAll(selectedSectors.map((x) => x.id!).toList(), selectedPrioritys.map((x) => x.id!).toList()).then((value) => {
      itens = value.obs,
      itens.refresh(),
    });
  }

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
        content: SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CallSectorDropdownPage(selectedSectors),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: CallPriorityDropdownPage(selectedPrioritys),
                ),
              ],
            ),
          )
        ),
        actionsPadding: const EdgeInsets.symmetric(vertical: 8),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            child: const Text('Filtrar'), 
            onPressed: () {
              findAll();
              Get.back();
            } 
          ),
        ],
      ),
    );
  }

  void onOpenDrawer(bool value) => Get.find<MenuDrawerController>().findNewNotifications();

}
