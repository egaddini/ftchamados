library call_user_dashboard;

import 'package:chamados/app/features/pages/call_requester/components/call_requester_detail_dialog_controller.dart';
import 'package:chamados/app/features/pages/call_requester/screen/call_requester_dashboard_controller.dart';
import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/shared_components/c_expanded_text_field.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.dart';
import 'package:chamados/app/shared_components/custom_drop_down_menu_button/custom_dropdown_button.dart';
import 'package:chamados/app/shared_components/custom_drop_down_menu_button/menu_item.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


part 'call_requester_row_source.dart';
part '../components/call_requester_detail_dialog.dart';

class CallUserDashboardScreen extends CustomPaginatedDataTable2<CallRequesterDashboardController> {
  
  const CallUserDashboardScreen({super.key});
  
  @override
  List<Widget> getActions() {
    return [];
  }
  
  @override
  List<DataColumn> getColumns() {
    return const [
      DataColumn2(label: Text("Título",),),                   
      DataColumn2(label: Text("Setor",),),
      DataColumn2(label: Text("Prioridade",),),
      DataColumn2(label: Text("Status",),),                    
      DataColumn2(label: Text("Criado em",),),
      DataColumn2(label: Text("Ultima atualizacao",),),                                                                                            
    ];
  }
  
  @override
  DataTableSource getDataTableSource() {
    return RowSource(
      myData: controller.data,
      count: controller.data.length,
    );
  }
  
  @override
  Widget getHeaderFields() {
    return TextFormField(
      controller: controller.searchFieldDataC,
      decoration: const InputDecoration(
        labelText: 'Buscar por Titulo',
        suffixIcon: Icon(Icons.search_outlined),                                                   
      ),
      onChanged: (value) {
        // setState(() {
        //   myData = filterData.where((element) => element.callType!.titulo.toString().toUpperCase().contains(value.toUpperCase())).toList();
        // });
      },
    );
  }
  
  @override
  String getTitle() => 'Meus Chamados';
}



