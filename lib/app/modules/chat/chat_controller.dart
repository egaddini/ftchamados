import 'dart:io';

import 'package:chamados/app/data/models/chat_message.dart';
import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/modules/chat/chat_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/app_config/service.dart';

class ChatController extends GetxController {

  final TextEditingController textField = TextEditingController();
  FocusNode textFieldFocus = FocusNode();
  late UserInfoModel user;

  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  
  RxBool isExpandedContacts = false.obs;

  final ChatRepository repository;

  ChatController(this.repository);

  @override
  void onInit() {
    // user = AppConfigService().to().userData();
    super.onInit();
  }

  expandContacts() => isExpandedContacts.value = !isExpandedContacts.value;

  enviar() {}

  anexar() async {
    
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }

  }

  // var focusNode = FocusNode(onKey: (node, event) {
  //   if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
  //       // Do something
  //       // Next 2 line needed If you don't want to update the text field with new line.
  //       // node.unfocus(); 
  //       // return true;
  //   }
  //   return false;

  // });

  void onSubmit(String message) {
    textField.text = '';
    textFieldFocus.requestFocus();
    messages.add(ChatMessage(chatId: '1', senderId: '1', recipientId: '1', content: message, data: 1,));
  }


}