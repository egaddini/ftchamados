library user_dashboard;

import 'package:chamados/app/features/pages/user/components/user_details_dialog.dart';
import 'package:chamados/app/features/pages/user/screens/user_screen_controller.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

part '../components/row_source.dart';

class UserScreen extends GetView<UserScreenController> {
  
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Scaffold(
      appBar: AppBar(title: const Text('Usuários')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            addVerticalSpace(10),
            SizedBox(
              width: double.infinity,
              child: PaginatedDataTable(
                sortColumnIndex: 0,
                sortAscending: controller.sort,
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.controller,
                          decoration: const InputDecoration(labelText: 'Buscar por email', suffixIcon: Icon(Icons.search_outlined),),
                          onChanged: (value) {
                            // setState(() {
                            //   controller.myData = filterData.where((element) => element.solicitante.toString().toUpperCase().contains(value.toUpperCase())).toList();
                            // });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                source: RowSource(
                  context: context,
                  myData: controller.userList,
                  count: controller.userList.length,
                  controller: controller,
                ),
                checkboxHorizontalMargin: 10,
                rowsPerPage: 10,
                columnSpacing: 6,
                showCheckboxColumn: false,
                columns: [
                  DataColumn(label: Text("ID", style: Get.theme.textTheme.titleSmall,),),
                  DataColumn(label: Text("Email", style: Get.theme.textTheme.titleSmall,),),                        
                  DataColumn(label: Text("Nome", style: Get.theme.textTheme.titleSmall,), onSort: (columnIndex, ascending) => controller.onsortColum(columnIndex, ascending),),
                  DataColumn(label: Text("Sobrenome", style: Get.theme.textTheme.titleSmall,),),
                  DataColumn(label: Text("Cargo", style: Get.theme.textTheme.titleSmall,),),
                  DataColumn(label: Text("Habilitado", style: Get.theme.textTheme.titleSmall,),),                        
                  DataColumn(label: Text("Data de Registro", style: Get.theme.textTheme.titleSmall,),),
                  const DataColumn(label: Text(''),),                                            
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}





