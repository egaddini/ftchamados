import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.controller.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CustomPaginatedDataTable2<T extends CustomPaginatedDataTable2Controller> extends GetView<T> {

  const CustomPaginatedDataTable2({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(title: Text(getTitle())),
      body: controller.isLoading.value ? buildLoadingIndicator() : PaginatedDataTable2(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        empty: const Text('Nenhum registro foi encontrado'),
        onRowsPerPageChanged: (value) => (),
        availableRowsPerPage: const [5, 10, 15],
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child:  getHeaderFields(),
        ),
        showFirstLastButtons: true,
        source: getDataTableSource(),
        actions: getActions(),
        rowsPerPage: 10,
        columnSpacing: 2,
        showCheckboxColumn: false,
        columns: getColumns(),
      ),
    ));
  }

  String getTitle();

  Widget getHeaderFields();

  List<Widget> getActions();

  DataTableSource getDataTableSource();

  List<DataColumn> getColumns();

}


