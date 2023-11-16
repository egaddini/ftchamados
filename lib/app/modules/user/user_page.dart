library user_page;

import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/modules/user/user_controller.dart';
import 'package:chamados/app/widgets/custom_data_table/custom_paginated_data_table2.dart';
import 'package:chamados/app/widgets/custom_ink_well/c2_inkwell.dart';
import 'package:chamados/core/utils/masks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/user_details_dialog.dart';

part 'widgets/row_source.dart';

class UserPage extends CustomPaginatedDataTable2<UserController> {
  const UserPage({super.key});

  @override
  List<Widget> getActions() {
    return [];
  }

  @override
  List<String> getColumns() => ['ID', 'Email', 'Nome', 'Sobrenome', 'Cargo', 'Habilitado', 'Data de Registro', '',];

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
          labelText: 'Buscar por email',
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
  String getTitle() => 'Usuários';
}
