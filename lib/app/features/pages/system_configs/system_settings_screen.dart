library system_configs_screen;

import 'package:chamados/app/config/routes/app_pages.dart';
import 'package:chamados/app/features/pages/call_type/screen/call_type_dashboard_screen.dart';
import 'package:chamados/app/shared_components/custom_card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'system_settings_controller.dart';

class SystemSettingsScreen extends StatelessWidget {
  
  SystemSettingsScreen({super.key});

  final SystemSettingsController _controller = Get.put(SystemSettingsController());

  @override
   Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,     
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlexCard(content: const Center(child: Text('Setor')), function: () =>  Get.toNamed(AppRoutes.home) ),
            CustomFlexCard(content: const Center(child: Text('Prioridade')), function: () =>  savePriorityDialog(context),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlexCard(content: const Center(child: Text('Categoria')), function: () {},),
            CustomFlexCard(content: const Center(child: Text('Fluxo')), function: () {},),
          ],
        ),                  
      ],
    );
  }
}

void systemSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) =>  AlertDialog(
      title: const Center(child: Text("Configura Sistema", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        child: SystemSettingsScreen(),
      ),
    )
  );
}