import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/features/pages/menu/components/create_call_page.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/utils/services/drawer_service.dart';
import 'package:chamados/app/utils/services/user_service.dart';
import 'package:chamados/app/shared_components/c_menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  DrawerService drawer = DrawerServiceImpl();
  String? userSelected;
  UserService userSvc = UserServiceImpl();
  final TextEditingController _aheadController = TextEditingController();
  List<CallType> _items = [];


  @override
  void initState() {
    super.initState();
    _items = userSvc.getAllCallTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Apoio'),
        ),
        backgroundColor: Pallete.gradient3,
      ),
      endDrawer: MenuDrawer(
        accountEmail: "Edder@mail.com",
        accountName: "Edder",
        currentAccountPicture: const CircleAvatar(
          child: Text("ed"),
        ),
        drawerItems: drawer.getDrawerItems(context, userSvc.getLogedUserInfo(context)),
      ),

      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Center(
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    const Text(
                        'Como podemos ajudar?',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 900,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TypeAheadField<CallType>(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _aheadController,
                            textInputAction: TextInputAction.search,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              labelText: 'Digite um texto',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          suggestionsCallback: (pattern) {
                            return _items.where((call) =>
                                call.descricao.toLowerCase().contains(pattern.toLowerCase())).toList();
                          },
                          itemBuilder: (context, CallType call) {
                            return ListTile(
                              title: Text('${call.sigla} - ${call.descricao}'),
                            );
                          },
                          onSuggestionSelected: (CallType call) async {
                            var updatedItem = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CreateCallPage(call),
                              ),
                            );
                            if (updatedItem != null) {
                              setState(() {
                                _items[_items.indexWhere((i) => i.id == updatedItem.id)] = updatedItem;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ),
        ),
    );
  }
}
