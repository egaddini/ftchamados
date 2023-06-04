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
            child: Icon(Icons.delete_outline),
          ),
        ),
      ),
    ],
  );
}

void removeClient(BuildContext context, UserInfoModel user) {

  UserRepository userRepo = UserRepositoryImpl();
  
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Deletar Cliente"),
      content: Text("O usuário: ${user.email ?? "?"} será deletado para sempre, deseja realmente continuar?"),
      actions: [
        TextButton(
          onPressed: () async {
            try {
              waitProgressBar(context); 
              await userRepo.delete(user.id!);
              Navigator.pop(context);
              final snackBar = SnackBar(
                content: const Text('Usuário removido com sucesso!'),
                action: SnackBarAction(
                  label: 'Ver Mais',
                  onPressed: () {
                    moreDetailsDialog(context, 'Usuário removido com sucesso!', 'O usuário: ${user.email ?? "?"} foi deletado.');
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } on DioError catch (e) {
              Navigator.of(context).pop();
              final snackBar = SnackBar(
                content: const Text('Algum problema aconteceu!'),
                action: SnackBarAction(
                  label: 'Ver Mais',
                  onPressed: () {
                    moreDetailsDialog(context, 'Algum problema aconteceu!', 'se o problema persistir entre em contato com o suporte \n${e.error}');
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            Navigator.pop(context);
          },
          child: const Center(child: Icon(Icons.delete_outline)),
        ),
      ],
    )
  );
}