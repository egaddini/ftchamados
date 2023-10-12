part of call_category;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  CallCategoryController controller;

  RowSource({
    required this.myData,
    required this.count,
    required this.controller,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount)
        ? recentFileDataRow(myData[index], controller, index)
        : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(
    CallCategoryModel category, CallCategoryController controller, int index) {
  return DataRow(
    onSelectChanged: (value) => createUpdateCategoryDialog(category)
        .then((value) => controller.atualizarItens()),
    cells: [
      DataCell(Text(category.id.toString())),
      DataCell(Text(category.sector!.acronym)),
      DataCell(Text(category.sector!.name)),
      DataCell(Text(category.title!)),
      DataCell(Text(category.priority!.name)),
      DataCell(Text(category.description!)),
      DataCell(SizedBox(
          height: 40,
          width: 40,
          child: cInkWell(
              22,
              30,
              Icons.delete,
              Icons.delete_forever_outlined,
              Get.theme.primaryColor,
              Colors.red,
              'Deletar',
              () => controller.deleteItem(index)))),
    ],
  );
}
