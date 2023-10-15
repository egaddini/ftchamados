import 'package:chamados/app/modules/call/components/new_call/new_call_controller.dart';
import 'package:chamados/app/modules/call/components/new_call/new_call_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:chamados/app/data/models/call_category_model.dart';
import 'package:chamados/app/widgets/custom_card/custom_card.dart';


class CarrouselCardWidget extends StatelessWidget {
  final CallCategoryModel call;

  const CarrouselCardWidget({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    return CustomCard.customClickableCard(
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
      function: () => Get.dialog(NewCallForm(controller: Get.put<NewCallController>(NewCallController(callCategory: call))),),
    );
  }
}
