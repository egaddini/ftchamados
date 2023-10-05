library home_screen;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chamados/app/config/routes/app_pages.dart';
import 'package:chamados/app/config/themes/theme_constants.dart';
import 'package:chamados/app/features/pages/call/components/new_call/new_call_dialog.dart';
import 'package:chamados/app/features/pages/call_settings/call_settings_screen.dart';
import 'package:chamados/app/features/pages/user_settings/user_settings_dialog.dart';
import 'package:chamados/app/shared_components/custom_card/custom_card.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/category/call_category_repository.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:get/get.dart';


part 'drawer/menu_drawer.dart';
part 'drawer/menu_drawer_controller.dart';
part 'home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  
  HomeScreen({Key? key,}) : super(key: key);
  
  final TextEditingController _aheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value ? buildLoadingIndicator() : Scaffold(
      appBar: AppBar(title: const Text('Apoio')),
      endDrawer: controller.drawer(),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,              
            children: [
              addVerticalSpace(100),
              const Text('Como podemos ajudar?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45,),),
              addVerticalSpace(40),
              Padding(
                padding: const EdgeInsets.all(40.0),
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
                  suggestionsCallback: (pattern) => controller.itens,
                  itemBuilder: (context, CallCategoryModel call) => ListTile(title: Text('${call.sector!.acronym} - ${call.title}'),),
                  onSuggestionSelected: (CallCategoryModel call) async => newCallDialog(call),
                ),
              ),
              addVerticalSpace(100),
              SizedBox(
                child: Expanded(
                  child: CarouselSlider(
                    items: controller.imgList,
                    carouselController: controller.carouselC,
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.2,
                      enlargeFactor: 0.1,
                      onPageChanged: (index, reason) => controller.setCarousel(index),
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
    ));
  }
}
