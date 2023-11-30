import 'package:chamados/app/data/models/user_dto.dart';
import 'package:chamados/app/modules/chat/widgets/contacts_repository.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ContactsController extends GetxController {
  
  static const _pageSize = 20;

  final ContactsRepository _repository;

  ContactsController(this._repository);


  final PagingController<int, UserDTO> pagingController = PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _repository.getBeerList(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
  
}