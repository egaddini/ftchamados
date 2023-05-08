part of user_dashboard;

class RowSource extends DataTableSource {
  var myData;
  final count;
  final context;


  RowSource({
    required this.context,
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount) ? recentFileDataRow(myData![index], context) : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(UserInfoModel user, BuildContext context) {
  return DataRow(
    onSelectChanged: (value) async =>  await Navigator.push(context, MaterialPageRoute(builder: (_) => EditUserPage(user),),),
    cells: [
      DataCell(Text(user.id.toString())),
      DataCell(Text(user.email.toString())),
      DataCell(Text(user.nome.toString())),
      DataCell(Text(user.sobrenome.toString())),
      DataCell(Text(user.role.toString())),
      DataCell(
        IgnorePointer(
          ignoring: true,
          child: Checkbox(
            value: user.habilitado,
            onChanged: null,
          ),
        ),
      ),
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(user.dataCriacao!).toString())),
    ],
  );
}