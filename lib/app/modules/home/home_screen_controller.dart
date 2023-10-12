part of home_screen;

class HomeScreenController extends GetxController {
  RxBool isHovered = false.obs, isLoading = true.obs;
  RxList<CallCategoryModel> itens = <CallCategoryModel>[].obs;
  CallCategoryRepository callRepo = CallCategoryRepository();
  late UserInfoModel? logedUser;
  RxInt current = 0.obs;
  final CarouselController carouselC = CarouselController();

  RxList<Widget> imgList = <Widget>[].obs;

  @override
  void onInit() {
    LocalStorageServices().getUser().then((value) => {
          logedUser = value,
          callRepo.getList().then((value) => {
                itens = value.obs,
                imgList.addAll(
                    value.map((element) => buildCard(element)).toList()),
              }),
          logedUser == null
              ? Get.offAndToNamed(AppRoutes.login)
              : isLoading.value = false,
        });
    super.onInit();
  }

  setCarousel(int index) => current.value = index;

  Widget drawer() => MenuDrawer(user: logedUser!);

  Widget buildCard(CallCategoryModel call) {
    return CustomFlexCard(
      height: 300,
      content: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  call.title!,
                  style: Get.textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
            Text(
              'Setor: ${call.sector!.acronym} - ${call.sector!.name}',
              style: Get.textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              'Prioridade: ${call.priority!.name}',
              style: Get.textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              'Descrição: ${call.description!}',
              style: Get.textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
            ),
          ],
        ),
      ),
      function: () => newCallDialog(call),
    );
  }
}
