import 'package:flutter/material.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';

import 'package:chamados/core/utils/helper.dart';

import 'custom_paginated_data_table2.controller.dart';

abstract class CustomPaginatedDataTable2<
    T extends CustomPaginatedDataTable2Controller> extends GetView<T> {
  const CustomPaginatedDataTable2({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text(getTitle())),
          body: controller.isLoading.value
              ? buildLoadingIndicator()
              : PaginatedDataTable2(
                  headingTextStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                  empty: const Text('Nenhum registro foi encontrado'),
                  onRowsPerPageChanged: (value) => (),
                  availableRowsPerPage: const [5, 10, 15],
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: getHeaderFields(),
                  ),
                  showFirstLastButtons: true,
                  source: getDataTableSource(),
                  actions: getActions(),
                  rowsPerPage: 10,
                  columnSpacing: 2,
                  showCheckboxColumn: false,
                  wrapInCard: false,
                  columns: getColumns(),
                  headingCheckboxTheme: Get.theme.checkboxTheme,
                ),
        ));
  }

  String getTitle();

  Widget getHeaderFields();

  List<Widget> getActions();

  DataTableSource getDataTableSource();

  List<DataColumn> getColumns();
}
