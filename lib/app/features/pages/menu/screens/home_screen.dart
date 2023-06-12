// ignore_for_file: public_member_api_docs, sort_constructors_first
library home_screen;

import 'package:chamados/app/features/pages/call/screen/call_dashboard_screen.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/call_type/call_type_repository.dart';
import 'package:chamados/app/utils/repositories/call_type/call_type_repository_impl.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/features/pages/user/components/edit_user_page.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/models/user_info_model.dart';

part '../components/menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {

  bool isLoading = true;
  final TextEditingController _aheadController = TextEditingController();
  CallTypeRepository callRepo = CallTypeRepositoryImpl();
  final List<CallType> _items = [];

  

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }

  Future<void> _init() async {
    _items.addAll(await callRepo.getCallTypeList());
    _setLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apoio')),
      endDrawer: const MenuDrawer(),
      body: Center(
        child: isLoading ? buildLoadingIndicator() : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,              
            children: [
              const Text(
                  'Como podemos ajudar?',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TypeAheadField<CallType>(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _aheadController,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Digite um texto',
                      suffixIcon: Icon(Icons.search_outlined),                                                            
                    ),
                  ),
                  suggestionsCallback: (pattern) {
                    return _items.where((call) => call.descricao.toLowerCase().contains(pattern.toLowerCase())).toList();
                  },
                  itemBuilder: (context, CallType call) {
                    return ListTile(
                      title: Text('${call.setor.sigla} - ${call.titulo}'),
                    );
                  },
                  onSuggestionSelected: (CallType call) async {
                    newCallDialog(context, call);
                    // if (updatedItem != null) {
                    //   setState(() {
                    //     _items[_items.indexWhere((i) => i.id == updatedItem.id)] = updatedItem;
                    //   });
                    // }
                  },
                ),
              ),
              const SizedBox(height: 600),
            ]
          ),
        ),
      ),
    );
  }
}
