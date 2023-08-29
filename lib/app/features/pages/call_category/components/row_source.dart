part of call_category;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  BuildContext context;
  CallCategoryController controller;

  RowSource({
    required this.context,
    required this.myData,
    required this.count,
    required this.controller,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount) ? recentFileDataRow(myData[index], context, controller, index) : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(CallCategoryModel category, BuildContext context, CallCategoryController controller, int index) {
  return DataRow(
    onSelectChanged: (value) => createUpdateCategoryDialog(category).then((value) => controller.atualizarItens()),
    cells: [
      DataCell(Text(category.id.toString())),
      DataCell(Text(category.sector!.sigla)),
      DataCell(Text(category.sector!.nome)),
      DataCell(Text(category.titulo!)),
      DataCell(Text(category.prioridade!.nome)),
      DataCell(Text(category.descricao!)),      
      DataCell(SizedBox(height: 40, width: 40, child: cInkWell(22, 30, Icons.delete, Icons.delete_forever_outlined, Get.theme.primaryColor, Colors.red, 'Deletar', () => controller.deleteItem(index)))),        
    ],
  );
}