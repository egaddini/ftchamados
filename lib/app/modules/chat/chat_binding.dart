import 'package:chamados/app/modules/chat/chat_controller.dart';
import 'package:get/get.dart';

import 'chat_repository.dart';

class ChatBinding implements Bindings {

  @override
  void dependencies() {

    Get.lazyPut<ChatController>(() => ChatController(ChatRepository(Get.find())));

  }
}