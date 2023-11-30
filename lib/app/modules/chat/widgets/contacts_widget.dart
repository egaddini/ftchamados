import 'package:chamados/app/data/models/user_dto.dart';
import 'package:chamados/app/modules/chat/widgets/contacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ContactsWidget extends GetView<ContactsController> {
   
   const ContactsWidget({super.key});
   
   @override
   Widget build(BuildContext context) {
    return Container(); 
    // PagedListView<int, UserDTO>(
    //   pagingController: controller.pagingController,
    //   builderDelegate: PagedChildBuilderDelegate<UserDTO>(
    //     itemBuilder: (context, item, index) => BeerListItem(
    //       beer: item,
    //     ),
    //   ),
    // );
  }
}