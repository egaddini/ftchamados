import 'package:flutter/material.dart';

class RowSource extends DataTableSource {
  dynamic myData;
  Function recentFileDataRow;

  RowSource({
    required this.myData,
    required this.recentFileDataRow,
  });

  @override
  DataRow? getRow(int index) {
    if ((index < rowCount)) {
      return (() => recentFileDataRow(myData[index])) as DataRow;
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => myData.length;

  @override
  int get selectedRowCount => 0;
  
}