import 'package:chamados/app/config/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chamados/app/shared_components/custom_card/custom_card.dart';


systemSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Center(child: Text("Configura Sistema", style: TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        child: chamadosSettingsForm(),
      ),
    )
  );
}

Widget chamadosSettingsForm() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,     
    children: [
      Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFlexCard(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_tree_outlined, size: 30, color: Get.theme.colorScheme.primary,),
                ),
                Text('Status', style: Get.textTheme.titleLarge,),
              ],
            ), 
            function: () => Get.toNamed(AppRoutes.callStatus), 
          ),
          CustomFlexCard(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.cases_outlined, size: 30, color: Get.theme.colorScheme.primary,),
                ),
                Text('Setor', style: Get.textTheme.titleLarge,),
              ],
            ), 
            function: () =>  Get.toNamed(AppRoutes.callSector), 
          ),
        ],
      ),
      Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFlexCard(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.low_priority_rounded, size: 30, color: Get.theme.colorScheme.primary,),
                ),
                Text('Prioridade', style: Get.textTheme.titleLarge,),
              ],
            ), 
            function: () =>  Get.toNamed(AppRoutes.callPriority),  
          ),
          CustomFlexCard(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.auto_stories_outlined, size: 30, color: Get.theme.colorScheme.primary,),
                ),
                Text('Categoria', style: Get.textTheme.titleLarge,),
              ],
            ), 
            function: () =>  Get.toNamed(AppRoutes.callCategory),  
          ),
        ],
      ),                                        
    ],
  );
}