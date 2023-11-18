// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/data/models/call_category_model.dart';
import 'package:chamados/app/data/models/call_status_model.dart';
import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/modules/call/dashboard/call_dashboard_repository.dart';
import 'package:chamados/app/widgets/custom_drop_down_menu_button/menu_item.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/status/call_status_dropdown_page.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/call.dart';
import '../../../data/models/priority.dart';
import '../../../data/services/app_config/service.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.controller.dart';
import '../../../widgets/dropdown_entity_widget/priority/call_priority_dropdown_page.dart';

class CallDashboardController extends CustomPaginatedDataTable2Controller<Call> {
  
  bool sort = true;
  late UserInfoModel user;

  late DateTime? selectedDate = DateTime.now();

  RxList<PriorityModel> selectedPrioritys = <PriorityModel>[].obs;
  RxList<CallCategoryModel> selectedCategorys = <CallCategoryModel>[].obs;
  RxList<CallStatusModel> selectedStatus = <CallStatusModel>[].obs;

  RxList selectedItems = [].obs;

  final CallDashboardRepository repository;

  CallDashboardController(this.repository);

  @override
  void onInit() {
    user = AppConfigService().to().userData();
    findAll();
    super.onInit();
  }

  findAll() {
    if (user.sectors.isNotEmpty) {
      repository.findAll(
      '', 
      '', 
      user.sectors.obs.map((x) => x.id!).toList(), 
      selectedPrioritys.map((x) => x.id!).toList(), 
      selectedCategorys.map((x) => x.id!).toList(), 
      selectedStatus.map((x) => x.id!).toList()).then((value) => {
        data.value = value,
        isLoading.value = false,
      });
    }
  }

  DropdownMenuItem toDropdownMenuItem(Widget item) {
    return DropdownMenuItem<MenuItem>(
      child: item,
      onTap: () {},
    );
  }

  filter() {
    return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        title: AppBar(
          title: const Text('Busca Aprimorada'),
          forceMaterialTransparency: true,
        ),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140,
                    child: DateTimeField(
                      dateFormat: DateFormat('dd/mm/yy HH:mm'),
                      onDateSelected: (value) => selectedDate = value, 
                      selectedDate: selectedDate,
                      decoration: const InputDecoration(
                        labelText: 'De'
                        
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: DateTimeField(
                      dateFormat: DateFormat('dd/mm/yy HH:mm'),
                      onDateSelected: (value) => selectedDate = value, 
                      selectedDate: selectedDate,
                      decoration: const InputDecoration(
                        labelText: 'Até'
                      ),
                    ),
                  ),
                ],
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CallPriorityDropdownPage(selectedPrioritys),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CallStatusDropdownPage(selectedStatus),
                ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(vertical: 8),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            child: const Text('Filtrar'), 
            onPressed: () {
              findAll();
              Get.back();
            }
          ),
        ],
      ),
    );
  }
}
