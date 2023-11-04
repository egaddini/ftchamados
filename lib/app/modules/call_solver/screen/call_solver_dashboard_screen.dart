library call_user_dashboard;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/call.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.dart';
import 'call_detail/call_detail_screen.dart';
import 'call_solver_dashboard_controller.dart';

part 'call_solver_row_source.dart';

class CallSolverDashboardScreen extends CustomPaginatedDataTable2<CallSolverDashboardController> {
  const CallSolverDashboardScreen({super.key});

  @override
  List<Widget> getActions() => [];

  @override
  List<String> getColumns() => ['Título', 'Setor', 'Prioridade', 'Status', 'Criado em', 'Ultima atualizacao'];

  @override
  DataTableSource getDataTableSource() => RowSource(myData: controller.data, count: controller.data.length,);

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
