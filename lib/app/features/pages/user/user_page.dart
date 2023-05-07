import 'package:chamados/app/features/pages/user/edit_user_page.dart';
import 'package:chamados/app/features/pages/user/message_response.dart';
import 'package:chamados/app/features/pages/user/register_user.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/shared_components/c_appbar.dart';
import 'package:chamados/app/utils/repositories/user_repository.dart';
import 'package:chamados/app/utils/repositories/user_repository_impl.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {

  UserRepository userRepo = UserRepositoryImpl();

  List<UserInfoModel> clients = [];

  Future<void> _init() async {
    clients = await userRepo.getuserList();
  }

  @override
    void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Usuários'),
      body: Center(
        child: Container(
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
                onLongPress: () {
                  removeClient(context, clients[index]);
                },
                title: Text((clients[index].firstname ?? "não definido") + (clients[index].lastname ?? "não definido")),
                subtitle: Text(clients[index].email ?? 'Email não disponível'),
                leading: CircleAvatar(
                  child: Text("clients[index].name.substring(0, 1)"),
                ),
                trailing: Icon(
                  Icons.call,
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterUser()))
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
        tooltip: "Agregar Contacto",
        child: Icon(Icons.add),
      ),
    );
  }

  removeClient(BuildContext context, UserInfoModel client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Cliente"),
              content: Text("Esta seguro de eliminar a " + (client.firstname ?? "?")),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.clients.remove(client);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }

}
