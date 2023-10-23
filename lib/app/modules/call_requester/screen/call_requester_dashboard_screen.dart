library call_user_dashboard;

import 'package:chamados/app/modules/call_requester/detail_dialog/call_requester_detail_dialog.dart';
import 'package:chamados/app/modules/call_requester/detail_dialog/call_requester_detail_dialog_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/call.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.dart';
import '../detail_dialog/call_requester_detail_dialog_controller.dart';
import 'call_requester_dashboard_controller.dart';

part 'call_requester_row_source.dart';

class CallUserDashboardScreen extends CustomPaginatedDataTable2<CallRequesterDashboardController> {
  const CallUserDashboardScreen({super.key});

  @override
  List<Widget> getActions() {
    return [];
  }

  @override
  List<String> getColumns() => ['Título', 'Setor', 'Prioridade', 'Status', 'Criado em', 'Última atualização'];

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
