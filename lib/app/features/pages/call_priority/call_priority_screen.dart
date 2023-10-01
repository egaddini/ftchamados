library call_priority;

import 'package:chamados/app/features/pages/call_priority/call_priority_controller.dart';
import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'components/create_update_priority_controller.dart';

part 'components/row_source.dart';
part 'components/create_update_priority_dialog.dart';

class CallPriorityStatusScreen extends CustomPaginatedDataTable2<CallPriorityController>  {

  const CallPriorityStatusScreen({super.key});

  @override
  List<Widget> getActions() => [FilledButton(onPressed: () => createUpdatePriorityDialog(null).then((value) => controller.atualizarItens()), child: const Text('Novo Registro'),)];
  
  @override
  List<DataColumn> getColumns() {
    return const [
      DataColumn(label: Text("Id"),),
      DataColumn(label: Text("Nome"),),    
      DataColumn(label: Text("Peso"),),    
      DataColumn(label: Text('',)),    
    ];
  }
  
  @override
  DataTableSource getDataTableSource() {
    return RowSource(
      myData: controller.data,
      count: controller.data.length,
      controller: controller
    );
  }
  
  @override
  Widget getHeaderFields() {
    return Expanded(
      child: TextFormField(
        controller: controller.searchFieldDataC,
        decoration: const InputDecoration(labelText: 'Buscar nome', suffixIcon: Icon(Icons.search_outlined),),
        onChanged: (value) {
          // setState(() {
          //   controller.myData = filterData.where((element) => element.solicitante.toString().toUpperCase().contains(value.toUpperCase())).toList();
          // });
        },
      ),
    );
  }
  
  @override
  String getTitle() => 'Prioridades';
}



