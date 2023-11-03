// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'package:chamados/app/data/models/call_category_model.dart';
import 'package:chamados/app/widgets/custom_card/custom_card.dart';

import '../../call/call_repository.dart';
import '../../call/components/new_call/new_call_controller.dart';
import '../../call/components/new_call/new_call_dialog.dart';


ResponsiveGridCol gridCardWidget(CallCategoryModel call) {
  return ResponsiveGridCol(
    xs: 6,
    md: 3,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: CustomCard.customClickableCard(
        height: 160,
        width: Get.width * 0.3,
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
                maxLines: 2,
              ),
            ],
          ),
        ),
        function: () => Get.dialog(
          NewCallForm(
            controller: Get.put<NewCallController>(NewCallController(callCategory: call, callRepo: Get.put(CallRepository())),)),
          ).then((value) => Get.delete<NewCallController>()
        ),
        onLongPress: () => Get.dialog(
          moreDetailsAboutCategodyDialog(call),
        ),
      ),
    ),
  );
}

AlertDialog moreDetailsAboutCategodyDialog(CallCategoryModel call) {
  return AlertDialog(
    titlePadding: const EdgeInsets.only(bottom: 2.0),
    contentPadding: const EdgeInsets.only(top: 2, bottom: 20, right: 10, left: 10),
    title: AppBar(
      title: Text(call.title!),
      forceMaterialTransparency: true,
    ),
    content: SizedBox(
      width: Get.width * 0.3,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  maxLines: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    )
  );
}

