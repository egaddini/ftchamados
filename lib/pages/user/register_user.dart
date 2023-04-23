import 'package:chamados/models/user_info_model.dart';
import 'package:chamados/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:chamados/pages/user/text_box.dart';

class RegisterUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {
  late TextEditingController controllerName ;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerSurname = new TextEditingController();
    controllerPhone = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Contactos"),
        ),
        body: ListView(
          children: [
            TextBox(controllerName, "Nombre"),
            TextBox(controllerSurname, "Apellido"),
            TextBox(controllerPhone, "Telefono"),
            ElevatedButton(
                onPressed: () {
                  String name = controllerName.text;
                  String surname = controllerSurname.text;
                  String phone = controllerPhone.text;

                  if (name.isNotEmpty &&
                      surname.isNotEmpty &&
                      phone.isNotEmpty) {
                    Navigator.pop(context,
                        UserInfoModel());
                  }
                },
                child: const Text("Guardar Contacto")),
          ],
        ));
  }
}