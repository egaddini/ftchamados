library user_dashboard;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/user_info_model.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.dart';
import '../../../widgets/custom_ink_well/c_inkwell.dart';
import '../components/user_details_dialog.dart';
import 'user_screen_controller.dart';

part '../components/row_source.dart';

class UserScreen extends CustomPaginatedDataTable2<UserScreenController> {
  const UserScreen({super.key});

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
