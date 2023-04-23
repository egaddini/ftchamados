import 'package:chamados/models/user_info_model.dart';
import 'package:chamados/pages/user/edit_user_page.dart';
import 'package:chamados/pages/user/register_user.dart';
import 'package:chamados/pallete.dart';
import 'package:chamados/repositories/user_repository.dart';
import 'package:chamados/repositories/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:chamados/pages/user/message_response.dart';

class UserDashboardpage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _UserDashboardpage();
}

class _UserDashboardpage extends State<UserDashboardpage> {

  UserRepository userRepo = UserRepositoryImpl();

  //List<UserInfoModel> clients = [];

  //Future<void> _init() async {
    //clients = await userRepo.getuserList();
    List<UserInfoModel> clients = [
        UserInfoModel(
          id: 1,
          firstname: 'Alice',
          lastname: 'Adams',
          email: 'alice.adams@example.com',
          role: 'admin',
          token: '123-456-789',
        ),
        UserInfoModel(
          id: 2,
          firstname: 'Bob',
          lastname: 'Brown',
          email: 'bob.brown@example.com',
          role: 'user',
          token: '456-789-123',
        ),
        UserInfoModel(
          id: 3,
          firstname: 'Charlie',
          lastname: 'Clark',
          email: 'charlie.clark@example.com',
          role: 'user',
          token: '789-123-456',
        ),
        UserInfoModel(
          id: 4,
          firstname: 'David',
          lastname: 'Davis',
          email: 'david.davis@example.com',
          role: 'moderator',
          token: '123-789-456',
        ),
        UserInfoModel(
          id: 5,
          firstname: 'Eve',
          lastname: 'Evans',
          email: 'eve.evans@example.com',
          role: 'user',
          token: '456-123-789',
        ),
        UserInfoModel(
          id: 6,
          firstname: 'Frank',
          lastname: 'Franklin',
          email: 'frank.franklin@example.com',
          role: 'user',
          token: '789-456-123',
        ),
        UserInfoModel(
          id: 7,
          firstname: 'Grace',
          lastname: 'Garcia',
          email: 'grace.garcia@example.com',
          role: 'admin',
          token: '123-456-789',
        ),
        UserInfoModel(
          id: 8,
          firstname: 'Heidi',
          lastname: 'Harris',
          email: 'heidi.harris@example.com',
          role: 'user',
          token: '456-789-123',
        ),
        UserInfoModel(
          id: 9,
          firstname: 'Isaac',
          lastname: 'Ingram',
          email: 'isaac.ingram@example.com',
          role: 'user',
          token: '789-123-456',
        ),
        UserInfoModel(
          id: 10,
          firstname: 'Judy',
          lastname: 'Johnson',
          email: 'judy.johnson@example.com',
          role: 'moderator',
          token: '123-789-456',
        ),
      ];
  //}

  /*@override
    void initState() {
    super.initState();
    _init();
  }*/

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
