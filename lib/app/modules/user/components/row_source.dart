// ignore_for_file: public_member_api_docs, sort_constructors_first
part of user_dashboard;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  UserScreenController controller;

  RowSource({
    required this.myData,
    required this.count,
    required this.controller,
  });

  @override
  DataRow? getRow(int index) {
    return (index < rowCount)
        ? recentFileDataRow(myData![index], controller)
        : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(UserInfoModel user, UserScreenController controller) {
  return DataRow(
    onSelectChanged: (value) async => userDetailsDialog(user),
    cells: [
      DataCell(Text(user.id.toString())),
      DataCell(Text(user.email.toString())),
      DataCell(Text(user.firstName.toString())),
      DataCell(Text(user.lastName.toString())),
      DataCell(Text(user.role.toString())),
      DataCell(
        Checkbox(
          value: user.active,
          onChanged: (value) {},
        ),
      ),
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm')
          .format(DateTime.parse(user.creationDT!))
          .toString())),
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
              'Remover',
              () => controller.removeUser(user)))),
    ],
  );
}
