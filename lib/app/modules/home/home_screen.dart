library home_screen;

import 'package:chamados/app/data/services/app_config/service.dart';
import 'package:chamados/app/modules/drawer/menu_drawer.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'package:chamados/app/modules/call_category/call_category_repository.dart';
import 'package:chamados/core/utils/helper.dart';

import '../../../core/theme/theme_manager.dart';
import '../../../routes/app_pages.dart';
import '../../data/models/call_category_model.dart';
import '../../data/models/user_info_model.dart';
import '../../data/providers/local_storage/local_storage.dart';
import '../../widgets/custom_card/custom_card.dart';
import '../call/components/new_call/new_call_dialog.dart';

part 'home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  
  HomeScreen({Key? key,}) : super(key: key);

  final TextEditingController _aheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Obx(() => controller.isLoading.value ? buildLoadingIndicator() : Scaffold(
          appBar: AppBar(title: const Text('Apoio')),
          endDrawer: const MenuDrawer(),
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addVerticalSpace(100),
                  const Text(
                    'Como podemos ajudar?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                  addVerticalSpace(40),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: TypeAheadField<CallCategoryModel>(
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
                      itemBuilder: (context, CallCategoryModel call) => ListTile(title:Text('${call.sector!.acronym} - ${call.title}'),
                      ),
                      onSuggestionSelected:(CallCategoryModel call) async => newCallDialog(call),
                    ),
                  ),
                  addVerticalSpace(100),
                  // SizedBox(
                  //   child: Expanded(
                  //     child: CarouselSlider(
                  //       items: controller.imgList,
                  //       carouselController: controller.carouselC,
                  //       options: CarouselOptions(
                  //         height: 300,
                  //         autoPlay: true,
                  //         enlargeCenterPage: true,
                  //         viewportFraction: 0.2,
                  //         enlargeFactor: 0.1,
                  //         onPageChanged: (index, reason) =>
                  //             controller.setCarousel(index),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ]),
          ),
        )
      ),
      onLoading: buildLoadingIndicator(),
      onEmpty: const Text('No data found'),
      onError: (error) => Text(error!),
    );
  }
}
