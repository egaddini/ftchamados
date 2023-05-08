import 'package:chamados/app/features/pages/user/components/edit_user_page.dart';
import 'package:chamados/app/features/pages/user/message_response.dart';
import 'package:chamados/app/features/pages/user/screens/register_user_screen.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/utils/repositories/user_repository.dart';
import 'package:chamados/app/utils/repositories/user_repository_impl.dart';
import 'package:chamados/app/utils/services/user_service.dart';
import 'package:flutter/material.dart';

class UserDashboardPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _UserDashboardPage();
}

class _UserDashboardPage extends State<UserDashboardPage> {

  UserRepository userRepo = UserRepositoryImpl();
  UserService userSvc = UserServiceImpl();

  List<UserInfoModel> clients = [];

  Future<void> _init() async {
    clients = userSvc.getAllUsersInfo();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
                child: Text("Usuários")
              ),
        backgroundColor: Pallete.gradient3,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditUserPage(clients[index])))
                      .then((newContact) {
                    if (newContact != null) {
                      setState(() {
                        clients.removeAt(index);
              
                        clients.insert(index, newContact);
              
                        messageResponse(
                            context, newContact.name + " a sido modificado...!");
                      });
                    }
                  });
                },
                title: Text('${clients[index].nome ?? "não definido"} ${clients[index].sobrenome ?? "não definido"} - ${clients[index].role ?? "não definido"}'),
                subtitle: Text(clients[index].email ?? 'Email não disponível'),
                leading: CircleAvatar(
                  backgroundColor: Pallete.gradient3,
                  foregroundColor: Colors.white,
                  child: Text(clients[index].nome!.substring(0, 1)),
                ),
                trailing: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    removeClient(context, clients[index]);
                  },
                  child: const SizedBox(
                    width: 35,
                    height: 35,
                    child: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.gradient3,
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterUserScreen()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                clients.add(newContact);
                messageResponse(
                    context, newContact.name + " a sido guardado...!");
              });
            }
          });
        },
        tooltip: "Adicionar Usuário",
        child: Icon(Icons.add),
      ),
    );
  }

  removeClient(BuildContext context, UserInfoModel client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Deletar Cliente"),
              content: Text("O usuário: ${client.nome ?? "?"} será deletado para sempre, deseja realmente continuar?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Voltar",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      clients.remove(client);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Deletar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ));
  }
}
