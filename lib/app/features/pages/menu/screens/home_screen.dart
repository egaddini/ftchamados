// ignore_for_file: public_member_api_docs, sort_constructors_first
library home_screen;

import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/features/pages/call/screen/new_call_screen.dart';
import 'package:chamados/app/features/pages/user/components/edit_user_page.dart';
import 'package:chamados/app/features/pages/user/message_response.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/utils/services/user_service.dart';

part '../components/menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
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
      endDrawer: MenuDrawer(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Center(
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const Text(
                        'Como podemos ajudar?',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TypeAheadField<CallType>(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _aheadController,
                            textInputAction: TextInputAction.search,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              labelText: 'Digite um texto',
                              contentPadding: EdgeInsets.all(23),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: Pallete.backgroundColor
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Pallete.gradient3,
                                ),
                              ),                                                            
                            ),
                          ),
                          suggestionsCallback: (pattern) {
                            return _items.where((call) =>
                                call.descricao.toLowerCase().contains(pattern.toLowerCase())).toList();
                          },
                          itemBuilder: (context, CallType call) {
                            return ListTile(
                              title: Text('${call.sigla} - ${call.titulo}'),
                            );
                          },
                          onSuggestionSelected: (CallType call) async {
                            var updatedItem = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NewCallScreen(call),
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
