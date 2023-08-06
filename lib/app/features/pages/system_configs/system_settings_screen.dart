library system_configs_screen;

import 'package:chamados/app/config/routes/app_pages.dart';
import 'package:chamados/app/features/pages/call_type/screen/call_type_dashboard_screen.dart';
import 'package:chamados/app/shared_components/custom_card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'system_settings_controller.dart';

class SystemSettingsScreen extends StatefulWidget {
  
  const SystemSettingsScreen({super.key});

  @override
  State<SystemSettingsScreen> createState() => _SystemSettingsScreenState();
}

class _SystemSettingsScreenState extends State<SystemSettingsScreen> {

  final SystemSettingsController _controller = Get.put(SystemSettingsController());

  @override
   Widget build(BuildContext context) {
    return Obx(() => !_controller.isLoading.value? Container() : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,     
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
            child: Card(
              elevation: 4,
              child: InkWell(
                child: SizedBox(
                width: 300,
                height: 100,
                  child: Text('data'),
                ),
                onTap: () => savePriorityDialog(Get.context!),
              ),
            ),
          ),
          InkWell(child: CustomFlexCard(content: const Center(child: Text('Categoria')), function: () {print('olá');},),
          onTap: () => print('object'),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlexCard(content: const Center(child: Text('Categoria')), function: () {print('olá');},),
            CustomFlexCard(content: const Center(child: Text('Fluxo')), function: () {print('olá');},),
          ],
        ),                  
      ],
    ));
  }
}

void systemSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) =>  const AlertDialog(
      title: Center(child: Text("Configura Sistema", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        child: SystemSettingsScreen(),
      ),
    )
  );
}