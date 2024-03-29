library home_screen;

import 'package:chamados/app/data/models/priority.dart';
import 'package:chamados/app/data/models/sector_model.dart';
import 'package:chamados/app/modules/call/call_repository.dart';
import 'package:chamados/app/modules/call/components/new_call/new_call_controller.dart';
import 'package:chamados/app/modules/home/home_repository.dart';
import 'package:chamados/app/modules/home/widgets/grid_card.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/priority/call_priority_dropdown_page.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'package:chamados/app/modules/drawer/menu_drawer.dart';
import 'package:chamados/core/utils/helper.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../data/models/call_category_model.dart';
import '../../widgets/custom_ink_well/c2_inkwell.dart';
import '../call/components/new_call/new_call_dialog.dart';
import '../drawer/menu_drawer_controller.dart';

part 'home_controller.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        appBar: AppBar(title: const Text('')),
        endDrawer: const MenuDrawer(),
        onEndDrawerChanged: (value) => controller.onOpenDrawer(value),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Flexible(child: Text('text_how_can_we_help'.tr, style: Get.textTheme.displayLarge, softWrap: true, textAlign: TextAlign.center)),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TypeAheadField<CallCategoryModel>(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: controller.aheadController,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'Digite um texto',
                      prefixIcon: Icon(Icons.search_outlined, color: Get.theme.primaryColor),
                      suffixIcon: CInkWell(defaultIcon: Icons.tune_outlined, function: () => controller.filter(), defaultColor: Get.theme.primaryColor)
                    ),
                  ),
                  suggestionsCallback: (pattern) => controller.itens,
                  itemBuilder: (context, CallCategoryModel call) => ListTile(
                    title: Text('${call.sector!.acronym} - ${call.title}'),
                  ),
                  onSuggestionSelected: (CallCategoryModel call) async => controller.newCall(call),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: ResponsiveGridRow(children: controller.itens.take(12).map((x) => gridCardWidget(x)).toList()),
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
