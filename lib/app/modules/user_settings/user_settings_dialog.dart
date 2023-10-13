import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/custom_card/custom_card.dart';

void usersSettingsDialog() {
  showDialog(
      context: Get.context!,
      builder: (_) => const AlertDialog(
            title: Center(
                child: Text(
              "Configura Usuários",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            content: SizedBox(
              child: UsersSettingsForm(),
            ),
          ));
}

class UsersSettingsForm extends StatelessWidget {
  const UsersSettingsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      Icons.people_alt_outlined,
                      size: 30,
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Lista de Usuários',
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
              function: () => Get.toNamed(AppRoutes.users),
            ),
            CustomCard.customClickableCard(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.poll_outlined,
                      size: 30,
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Estatísticas',
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
              function: () => Get.toNamed(AppRoutes.callSector),
            ),
          ],
        ),
      ],
    );
  }
}
