library call_priority;

import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'package:chamados/core/utils/helper.dart';

import '../../data/models/priority.dart';
import '../../widgets/custom_data_table/custom_paginated_data_table2.dart';
import '../../widgets/custom_ink_well/c_inkwell.dart';
import 'call_priority_controller.dart';
import 'components/create_update_priority_controller.dart';

part 'call_priority_row_source.dart';
part 'components/create_update_priority_dialog.dart';

class CallPriorityStatusScreen
    extends CustomPaginatedDataTable2<CallPriorityController> {
  const CallPriorityStatusScreen({super.key});

  @override
  List<Widget> getActions() => [
        FilledButton(
          onPressed: () => createUpdatePriorityDialog(null)
              .then((value) => controller.atualizarItens()),
          child: const Text('Novo Registro'),
        )
      ];

  @override
  List<String> getColumns() => ['Id', 'Nome', 'Peso', ''];

  @override
  DataTableSource getDataTableSource() {
    return RowSource(
        myData: controller.data,
        count: controller.data.length,
        controller: controller);
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
  String getTitle() => 'Prioridades';
}
