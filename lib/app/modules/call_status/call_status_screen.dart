library call_status;

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:graphite/graphite.dart';
import 'package:validatorless/validatorless.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../data/models/call_status_model.dart';
import '../../widgets/custom_data_table/custom_paginated_data_table2.dart';
import '../../widgets/custom_ink_well/c_inkwell.dart';
import 'call_status_controller.dart';
import 'components/create_update_status_controller.dart';

part 'components/create_update_status_dialog.dart';
part 'components/call_status_flow_dialog.dart';
part 'call_row_source.dart';

class CallStatusScreen extends CustomPaginatedDataTable2<CallStatusController> {
  const CallStatusScreen({super.key});

  @override
  String getTitle() => 'Status';

  @override
  List<Widget> getActions() {
    return [
      FilledButton(
        onPressed: () async => await createUpdateStatusDialog(null)
            .then((value) async => await controller.atualizarItens()),
        child: const Text('Novo Registro'),
      ),
      FilledButton(
        onPressed: () => callStatusFlowDialog(),
        child: const Text('Status Flow'),
      )
    ];
  }

  @override
  List<DataColumn2> getColumns() {
    return const [
      DataColumn2(label: Text("Id"), size: ColumnSize.M),
      DataColumn2(label: Text("Nome"), size: ColumnSize.M),
      DataColumn2(label: Text("Descrição"), size: ColumnSize.M),
      DataColumn2(label: Text("Peso"), size: ColumnSize.M),
      DataColumn2(
          label: Text(
        "Notifica Usuário",
      )),
      DataColumn2(
          label: Text(
        '',
      )),
    ];
  }

  @override
  Widget getHeaderFields() {
    return Expanded(
      child: TextFormField(
        controller: controller.searchFieldDataC,
        decoration: const InputDecoration(
          labelText: 'Buscar nome',
          suffixIcon: Icon(Icons.search_outlined),
        ),
        onChanged: (value) {
          // setState(() {
          //   controller.myData = filterData.where((element) => element.solicitante.toString().toUpperCase().contains(value.toUpperCase())).toList();
          // });
        },
      ),
    );
  }

  @override
  DataTableSource getDataTableSource() {
    return RowSource(
      count: controller.data.length,
      controller: controller,
      data: controller.data,
    );
  }
}
