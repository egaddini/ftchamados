library call_sector;

import 'package:chamados/app/features/pages/call_sector/call_sector_controller.dart';
import 'package:chamados/app/models/sector_model.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'components/create_update_sector_controller.dart';

part 'call_sector_row_source.dart';
part 'components/create_update_sector_dialog.dart';

class CallSectorStatusScreen extends CustomPaginatedDataTable2<CallSectorController> {

  const CallSectorStatusScreen({super.key});
  
  @override
  List<Widget> getActions() {
    return [
      FilledButton(onPressed: () => createUpdateSectorDialog(null).then((value) => controller.atualizarItens()), child: const Text('Novo Registro'),)
    ];
  }
  
  @override
  List<DataColumn> getColumns() {
    return const [
      DataColumn(label: Text("Id")),
      DataColumn(label: Text("Sigla"),),    
      DataColumn(label: Text("Nome"),),    
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
  String getTitle() => 'Setor';

}



