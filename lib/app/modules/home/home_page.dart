library home_screen;

import 'package:chamados/app/modules/call/call_repository.dart';
import 'package:chamados/app/modules/call/components/new_call/new_call_controller.dart';
import 'package:chamados/app/modules/home/widgets/grid_card.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/app/modules/call_category/call_category_repository.dart';
import 'package:chamados/app/modules/drawer/menu_drawer.dart';
import 'package:chamados/app/modules/home/widgets/carrousel_card_widget.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../data/models/call_category_model.dart';
import '../../data/models/user_info_model.dart';
import '../call/components/new_call/new_call_dialog.dart';

part 'home_controller.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        appBar: AppBar(title: const Text('Apoio')),
        endDrawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              addVerticalSpace(60),
              Flexible(child: Text('text_how_can_we_help'.tr, style: Get.textTheme.displayLarge, softWrap: true, textAlign: TextAlign.center)),
              addVerticalSpace(40),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TypeAheadField<CallCategoryModel>(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: controller.aheadController,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Digite um texto',
                      suffixIcon: Icon(Icons.search_outlined),
                    ),
                  ),
                  suggestionsCallback: (pattern) => controller.itens,
                  itemBuilder: (context, CallCategoryModel call) => ListTile(
                    title: Text('${call.sector!.acronym} - ${call.title}'),
                  ),
                  onSuggestionSelected: (CallCategoryModel call) async => Get.dialog(
                    NewCallForm(
                      controller: Get.put<NewCallController>(NewCallController(callCategory: call, callRepo: Get.put(CallRepository())),)),
                  ).then((value) => Get.delete<NewCallController>()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: ResponsiveGridRow(
                  children: controller.itens.take(12).map((element) => gridCardWidget(element)).toList(),
                ),
              ),
            ]
          ),
        ),
      ),
      onLoading: buildLoadingIndicator(),
      onEmpty: const Text('No data found'),
      onError: (error) => Text(error!),
    );
  }
}
