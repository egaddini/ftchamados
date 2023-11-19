part of '../user_page.dart';

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  UserController controller;

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

DataRow recentFileDataRow(UserInfoModel user, UserController controller) {
  return DataRow(
    onSelectChanged: (value) => userDetailsDialog(user, controller.userRepository),
    cells: [
      DataCell(Text(user.id.toString())),
      DataCell(Text(user.email.toString())),
      DataCell(Text(user.firstName.toString())),
      DataCell(Text(user.lastName.toString())),
      DataCell(Text(user.role.toString())),
      DataCell(Checkbox(value: user.active, onChanged: (value) {})),
      DataCell(Text(Masks.dateTimeMask(user.creationDT!))),
      DataCell(CInkWell(defaultIcon: Icons.delete, defaultColor: Get.theme.primaryColor, message: 'Remover', function: () => controller.removeUser(user))),
    ],
  );
}
