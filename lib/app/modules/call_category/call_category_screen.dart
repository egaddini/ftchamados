library call_category;

import 'package:chamados/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../data/models/call_category_model.dart';
import '../../data/models/priority.dart';
import '../../data/models/sector_model.dart';
import '../../widgets/custom_data_table/custom_paginated_data_table2.dart';
import '../../widgets/custom_ink_well/c_inkwell.dart';
import 'call_category_controller.dart';
import 'components/create_update_category_controller.dart';

part 'components/create_update_category_dialog.dart';
part 'components/row_source.dart';

class CallCategoryStatusScreen
    extends CustomPaginatedDataTable2<CallCategoryController> {
  const CallCategoryStatusScreen({super.key});

  @override
  List<Widget> getActions() {
    return [
      FilledButton(
        onPressed: () => createUpdateCategoryDialog(null)
            .then((value) => controller.atualizarItens()),
        child: const Text('Novo Registro'),
      )
    ];
  }

  @override
  List<String> getColumns() => ['Id', 'Sigla', 'Nome', 'Titulo', 'Prioridade', 'Descrição', ''];

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
  String getTitle() => 'Categorias';
}
