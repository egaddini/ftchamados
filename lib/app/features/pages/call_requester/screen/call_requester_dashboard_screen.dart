library call_user_dashboard;

import 'package:chamados/app/features/pages/call_requester/components/call_requester_detail_dialog_controller.dart';
import 'package:chamados/app/features/pages/call_requester/screen/call_requester_dashboard_controller.dart';
import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/shared_components/c_expanded_text_field.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


part '../components/row_source.dart';
part '../components/call_requester_detail_dialog.dart';

class CallUserDashboardScreen extends GetView<CallRequesterDashboardController> {
  
  const CallUserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Chamados')),
      body: Obx(() => SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(10), 
            SizedBox(
              width: double.infinity,
              child: PaginatedDataTable(
                sortColumnIndex: 0,
                sortAscending: controller.sort,
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.controller,
                    decoration: const InputDecoration(
                      labelText: 'Buscar por Titulo',
                      suffixIcon: Icon(Icons.search_outlined),                                                   
                    ),
                    onChanged: (value) {
                      // setState(() {
                      //   myData = filterData.where((element) => element.callType!.titulo.toString().toUpperCase().contains(value.toUpperCase())).toList();
                      // });
                    },
                  ),
                ),
                source: RowSource(
                  context: context,
                  myData: controller.myData,
                  count: controller.myData.length,
                ),
                checkboxHorizontalMargin: 10,
                rowsPerPage: 10,
                columnSpacing: 6,
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(
                    label: Text(
                      "Título",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),                   
                  DataColumn(
                    label: Text(
                      "Setor",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14
                      ),
                    ),
                    // onSort: (columnIndex, ascending) {
                    //   setState(() {
                    //     sort = !sort;
                    //   });
                    //   onsortColum(columnIndex, ascending);
                    // }
                  ),
                  DataColumn(
                    label: Text(
                      "Prioridade",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Status",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),                    
                  DataColumn(
                    label: Text(
                      "Criado em",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Ultima atualizacao",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),                                                                                            
                ],
              ),
            ),
          ]
        ),
      )
    ));
  }
}



