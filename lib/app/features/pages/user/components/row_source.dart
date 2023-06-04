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
      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(user.dataCriacao!)).toString())),
      DataCell(
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            removeClient(context, user);
          },
          child:  const SizedBox(
            width: 35,
            height: 35,
            child: Icon(Icons.close, color: Colors.red),
          ),
        ),
      ),
    ],
  );
}

void removeClient(BuildContext context, UserInfoModel user) {
      showDialog(
      context: context,
        builder: (_) => AlertDialog(
              title: const Text("Deletar Cliente"),
              content: Text("O usuário: ${user.email ?? "?"} será deletado para sempre, deseja realmente continuar?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Voltar",
                    style: TextStyle(color: Pallete.backgroundColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    /// setState(() {
                    ///   users.remove(user);
                    ///   Navigator.pop(context);
                    /// });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Deletar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ));
}