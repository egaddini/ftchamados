library home_screen;

import 'package:chamados/app/modules/call/components/new_call/new_call_controller.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/app/modules/call_category/call_category_repository.dart';
import 'package:chamados/app/modules/drawer/menu_drawer.dart';
import 'package:chamados/app/modules/home/widgets/carrousel_card_widget.dart';
import 'package:chamados/core/utils/helper.dart';

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
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              addVerticalSpace(100),
              Text('Como podemos ajudar?', style: Get.theme.textTheme.displayLarge,),
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
                  onSuggestionSelected: (CallCategoryModel call) async => Get.dialog(NewCallForm(controller: Get.put<NewCallController>(NewCallController(callCategory: call))),),
                ),
              ),
              addVerticalSpace(100),
              CarouselSlider(
                items: controller.imgList,
                carouselController: controller.carouselC,
                options: CarouselOptions(
                  autoPlay: true,
                  height: 200,
                  viewportFraction: 0.2,
                  onPageChanged: (index, reason) => controller.setCarousel(index),
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
