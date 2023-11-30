import 'package:chamados/app/modules/chat/chat_controller.dart';
import 'package:chamados/app/widgets/custom_ink_well/c2_inkwell.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {

  const ChatPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Row(
        children: [
          Obx(
            () => SizedBox(
              width: controller.isExpandedContacts.value ? 400 : 130,
              child: Card(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),                  
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Contatos', style: Get.textTheme.titleLarge),
                        controller.isExpandedContacts.value ? 
                          CInkWell(defaultColor: Get.theme.primaryColor, defaultIcon: Icons.arrow_back_ios, defaultWidith: 15, function: () => controller.expandContacts()) 
                          : CInkWell(defaultColor: Get.theme.primaryColor, defaultIcon: Icons.arrow_forward_ios, defaultWidith: 15, function: () => controller.expandContacts()), 
                      ],
                    ),
                    const Flexible(child: Divider()),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 8.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () =>  Expanded(
                      child: ListView.builder(
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                                    child: 
                                    Text(controller.messages[index].content, softWrap: true, overflow: TextOverflow. fade),

                                  )
                                ),
                              ],
                            );
                        },
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  TextFormField(
                    controller: controller.textField,
                    decoration: InputDecoration(
                      hintText: 'Aa',
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CInkWell(defaultColor: Get.theme.primaryColor, defaultIcon: Icons.attachment_outlined, message: 'Anexar', function: () => controller.anexar()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: CInkWell(defaultColor: Get.theme.primaryColor, defaultIcon: Icons.send_rounded, message: 'Enviar', function: () => controller.enviar()),
                          ),
                        ],
                      ),
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(90)), borderSide: BorderSide(color: Get.theme.primaryColor)),
                      focusedBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(90)), borderSide: BorderSide(color: Get.theme.primaryColor)),
                      enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(90)), borderSide: BorderSide(color: Get.theme.primaryColor)),
                    ),
                    onFieldSubmitted: (String value) => controller.onSubmit(value),
                    focusNode: controller.textFieldFocus,
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}