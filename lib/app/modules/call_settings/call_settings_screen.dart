import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/custom_card/custom_card.dart';

void callSettingsDialog() {
  showDialog(
      context: Get.context!,
      builder: (_) => const AlertDialog(
            title: Center(
                child: Text(
              "Configura Chamados",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            content: SizedBox(
              child: CallSettingsForm(),
            ),
          ));
}

class CallSettingsForm extends StatelessWidget {
  const CallSettingsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            children: [
              CustomCard.customClickableCard(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.account_tree_outlined,
                        size: 30,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Status',
                      style: Get.textTheme.titleLarge,
                    ),
                  ],
                ),
                function: () => Get.toNamed(AppRoutes.callStatus),
              ),
              CustomCard.customClickableCard(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.cases_outlined,
                        size: 30,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                    Text('Setor', style: Get.textTheme.titleLarge),
                  ],
                ),
                function: () => Get.toNamed(AppRoutes.callSector),
              ),
            ],
          ),
          Wrap(
            children: [
              CustomCard.customClickableCard(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.low_priority_rounded,
                        size: 30,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Prioridade',
                      style: Get.textTheme.titleLarge,
                    ),
                  ],
                ),
                function: () => Get.toNamed(AppRoutes.callPriority),
              ),
              CustomCard.customClickableCard(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.auto_stories_outlined,
                        size: 30,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Categoria',
                      style: Get.textTheme.titleLarge,
                    ),
                  ],
                ),
                function: () => Get.toNamed(AppRoutes.callCategory),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
