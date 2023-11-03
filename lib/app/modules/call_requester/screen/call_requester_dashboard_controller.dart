// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/data/models/user_info_model.dart';
import 'package:chamados/app/widgets/custom_drop_down_menu_button/menu_item.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/call.dart';
import '../../../data/services/app_config/service.dart';
import '../../../widgets/custom_data_table/custom_paginated_data_table2.controller.dart';
import '../../call/call_repository.dart';

class CallRequesterDashboardController extends CustomPaginatedDataTable2Controller<Call> {
  
  bool sort = true;

  RxString statusC = 'Aberto'.obs;

  late DateTime? selectedDate = DateTime.now();

    List<String> status = [
    'Aberto',
    'Em Triagem',
    'Em Andamento',
    'Aguardando Informações',
    'Aguardando Aprovação',
    'Em Espera',
    'Pendente',
    'Resolvido com Falha',
    'Cancelado',
    'Finalizado'
  ];

RxList selectedItems = [].obs;

  final CallRepository callRepo;
  CallRequesterDashboardController({
    required this.callRepo,
  });

  @override
  void onInit() {
    UserInfoModel user = UserInfoModel.fromJson(AppConfigService().to().userData());
    callRepo.getCallListByEmail(user.email!, user.isSolver()).then((value) => {
      data.value = value,
      isLoading.value = false,
    });
    super.onInit();
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
        titlePadding: const EdgeInsets.only(top: 10),
        contentPadding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        title: AppBar(
          title: const Text('Busca Aprimorada'),
          forceMaterialTransparency: true,
        ),
        content: SizedBox(
          width: 300,
          child: Obx(() => Column(
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      label: const Text('Status'),
                    ),
                    hint: const Text('Select Items', style: TextStyle(fontSize: 14)),
                    items: status.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        enabled: true,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final isSelected = selectedItems.contains(item);
                            return InkWell(
                              onTap: () {
                                isSelected ? selectedItems.remove(item) : selectedItems.add(item);
                                menuSetState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    if (isSelected) const Icon(Icons.check_box_outlined)
                                    else const Icon(Icons.check_box_outline_blank),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Text(item, style: const TextStyle(fontSize: 14,),),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    value: selectedItems.isEmpty ? null : selectedItems.last,
                    onChanged: (value) {},
                    selectedItemBuilder: (context) {
                      return status.map(
                        (item) {
                          return Container(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              selectedItems.join(', '),
                              style: const TextStyle(
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          );
                        },
                      ).toList();
                    },
                  ),
                ),
              ),
            ],
          )),
        ),
        actionsPadding: const EdgeInsets.symmetric(vertical: 8),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(onPressed: () {}, child: const Text('Filtrar'))
        ],
      ),
    );
  }
}
