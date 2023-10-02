library user_dashboard;

import 'package:chamados/app/features/pages/user/components/user_details_dialog.dart';
import 'package:chamados/app/features/pages/user/screens/user_screen_controller.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

part '../components/row_source.dart';

class UserScreen extends CustomPaginatedDataTable2<UserScreenController> {
  
  const UserScreen({super.key});
  
  @override
  List<Widget> getActions() {
    return [];
  }
  
  @override
  List<DataColumn2> getColumns() {
    return [
      DataColumn2(label: Text("ID", style: Get.theme.textTheme.titleSmall,),),
      DataColumn2(label: Text("Email", style: Get.theme.textTheme.titleSmall,),),                        
      DataColumn2(label: Text("Nome", style: Get.theme.textTheme.titleSmall,), onSort: (columnIndex, ascending) => controller.onsortColum(columnIndex, ascending),),
      DataColumn2(label: Text("Sobrenome", style: Get.theme.textTheme.titleSmall,),),
      DataColumn2(label: Text("Cargo", style: Get.theme.textTheme.titleSmall,),),
      DataColumn2(label: Text("Habilitado", style: Get.theme.textTheme.titleSmall,),),                        
      DataColumn2(label: Text("Data de Registro", style: Get.theme.textTheme.titleSmall,),),
      const DataColumn2(label: Text(''),),                                            
    ];
  }
  
  @override
  DataTableSource getDataTableSource() {
    return RowSource(
      myData: controller.data,
      count: controller.data.length,
      controller: controller,
    );
  }
  
  @override
  Widget getHeaderFields() {
    return Expanded(
      child: TextFormField(
        controller: controller.searchFieldDataC,
        decoration: const InputDecoration(labelText: 'Buscar por email', suffixIcon: Icon(Icons.search_outlined),),
        onChanged: (value) {
          // setState(() {
          //   controller.myData = filterData.where((element) => element.solicitante.toString().toUpperCase().contains(value.toUpperCase())).toList();
          // });
        },
      ),
    );
  }
  
  @override
  String getTitle() => 'Usuários';
  
}





