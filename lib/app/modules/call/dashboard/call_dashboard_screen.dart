library call_user_dashboard;

import 'package:chamados/app/modules/call/dashboard/call_row_source.dart';
import 'package:chamados/app/widgets/custom_ink_well/c2_inkwell.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.dart';
import 'call_dashboard_controller.dart';


class CallDashboardScreen extends CustomPaginatedDataTable2<CallDashboardController> {
  const CallDashboardScreen({super.key});

  @override
  List<Widget> getActions() {
    return [];
  }

  @override
  List<String> getColumns() => ['Título', 'Setor', 'Prioridade', 'Solicitante', 'Responsável', 'Status', 'Criado em', 'Última atualização'];

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
      decoration: InputDecoration(
        labelText: 'Buscar por',
        prefixIcon: const Icon(Icons.search_outlined),
        suffixIcon: CInkWell(defaultIcon: Icons.tune_outlined, function: controller.filter),
      ),
      onChanged: (value) {
        // setState(() {
        //   myData = filterData.where((element) => element.callType!.titulo.toString().toUpperCase().contains(value.toUpperCase())).toList();
        // });
      },
    );
  }

  @override
  String getTitle() => 'Chamados';

}
