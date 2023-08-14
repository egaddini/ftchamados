// ignore_for_file: public_member_api_docs, sort_constructors_first
part of user_dashboard;

class RowSource extends DataTableSource {
  dynamic myData;
  int count;
  BuildContext context;


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
      DataCell(IgnorePointer(ignoring: true,child: Checkbox(value: user.habilitado,onChanged: null,),),),
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
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Center(child: Text("Deletar Cliente")),
      content: DeleteUserDialog(user: user),
      actions: null,
    )
  );
}


class DeleteUserDialog extends StatefulWidget {

  final UserInfoModel user;

  const DeleteUserDialog({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<DeleteUserDialog> createState() => _DeleteUserDialogState();
}

class _DeleteUserDialogState extends State<DeleteUserDialog> {

  bool isLoading = false;
  late UserInfoModel user;

  UserRepository userRepo = UserRepositoryImpl();

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? buildLoadingIndicator() : SingleChildScrollView(
      child: Column(
        children: [
          Text("O usuário: ${user.email ?? "?"} será deletado para sempre, deseja realmente continuar?"),
          addVerticalSpace(10),
          TextButton(
            onPressed: () async {
                _setLoading();
                userRepo.delete(user.id!).then((_) {
                  Navigator.pop(context);
                  moreDetailsDialog(context, 'Usuário removido com sucesso!', 'O usuário: ${user.email ?? "?"} foi deletado.');
                }).catchError((error) {
                  _setLoading();
                  Navigator.pop(context);
                  tratarErro(context, error);
                });               
              },
            child: const Center(child: Icon(Icons.delete_outline)),
          ),
        ],
      ),
    );
  }
}