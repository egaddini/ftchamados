library home_screen;

import 'package:chamados/app/config/routes/app_pages.dart';
import 'package:chamados/app/config/themes/theme_constants.dart';
import 'package:chamados/app/features/pages/call/components/new_call/new_call_dialog.dart';
import 'package:chamados/app/features/pages/call_settings/call_settings_screen.dart';
import 'package:chamados/app/features/pages/user_settings/user_settings_dialog.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/category/call_category_repository.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:chamados/app/features/pages/user/components/edit_user_page.dart';
import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:get/get.dart';


part 'drawer/menu_drawer.dart';
part 'drawer/menu_drawer_controller.dart';
part 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  
  HomeScreen({Key? key,}) : super(key: key);
  
  final HomeScreenController _controller = Get.put(HomeScreenController());

  final TextEditingController _aheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.isLoading.value ? buildLoadingIndicator() : Scaffold(
      appBar: AppBar(title: const Text('Apoio')),
      endDrawer: _controller.drawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,              
            children: [
              const Text('Como podemos ajudar?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45,),),
              addVerticalSpace(40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TypeAheadField<CallCategoryModel> (
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _aheadController,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Digite um texto',
                      suffixIcon: Icon(Icons.search_outlined), 
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return _controller.items;
                  },
                  itemBuilder: (context, CallCategoryModel call) {
                    return ListTile(title: Text('${call.sector!.acronym} - ${call.title}'),);
                  },
                  onSuggestionSelected: (CallCategoryModel call) async {newCallDialog(call);},
                ),
              ),
              const SizedBox(height: 600),
            ]
          ),
        ),
      ),
    ));
  }
}
