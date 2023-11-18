import 'package:chamados/app/data/models/call_category_model.dart';
import 'package:chamados/app/data/models/call_status_model.dart';
import 'package:chamados/app/data/models/priority.dart';
import 'package:chamados/app/data/models/sector_model.dart';
import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/modules/call_solver/screen/call_solver_dashboard_repository.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/category/call_category_dropdown_page.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/priority/call_priority_dropdown_page.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/sector/call_sector_dropdown_page.dart';
import 'package:chamados/app/widgets/dropdown_entity_widget/status/call_status_dropdown_page.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/call.dart';
import '../../../data/services/app_config/service.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.controller.dart';

class CallSolverDashboardController extends CustomPaginatedDataTable2Controller<Call> {

  late UserInfoModel user;

  late DateTime? selectedDate = DateTime.now();

  RxList<PriorityModel> selectedPrioritys = <PriorityModel>[].obs;
  RxList<SectorModel> selectedSectors = <SectorModel>[].obs;
  RxList<CallCategoryModel> selectedCategorys = <CallCategoryModel>[].obs;
  RxList<CallStatusModel> selectedStatus = <CallStatusModel>[].obs;

  //   List<String> status = [
  //   'Aberto',
  //   'Em Triagem',
  //   'Em Andamento',
  //   'Aguardando Informações',
  //   'Aguardando Aprovação',
  //   'Em Espera',
  //   'Pendente',
  //   'Resolvido com Falha',
  //   'Cancelado',
  //   'Finalizado'
  // ];

  RxList selectedItems = [].obs;

  final CallSolverDashboardRepository repository;

  CallSolverDashboardController(this.repository);

  @override
  void onInit() {
    user = AppConfigService().to().userData();
    repository.findAll(
      user.email!, 
      '', 
      selectedSectors.map((x) => x.id!).toList(), 
      selectedPrioritys.map((x) => x.id!).toList(), 
      selectedCategorys.map((x) => x.id!).toList(), 
      selectedStatus.map((x) => x.id!).toList()).then((value) => {
        data.value = value,
        isLoading.value = false,
      }
    );
    super.onInit();
  }

  findAll() {
    repository.findAll(
      '', 
      user.email!, 
      selectedSectors.map((x) => x.id!).toList(), 
      selectedPrioritys.map((x) => x.id!).toList(), 
      selectedCategorys.map((x) => x.id!).toList(), 
      selectedStatus.map((x) => x.id!).toList()).then((value) => {
        data.value = value,
        isLoading.value = false,
    });
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
                child: CallCategoryDropdownPage(selectedCategorys),
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
