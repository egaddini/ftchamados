library call_priority;

import 'package:chamados/app/features/pages/call_priority/call_priority_controller.dart';
import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/shared_components/custom_ink_well/c_inkwell.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'components/create_update_priority_controller.dart';

part 'components/row_source.dart';
part 'components/create_update_priority_dialog.dart';

class CallPriorityStatusScreen extends GetView<CallPriorityController>  {

  const CallPriorityStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prioridade')),
      body: SingleChildScrollView(
        child: Column(
          children : [ 
            addVerticalSpace(10),
            SizedBox(
              width: double.infinity,
              child: Obx(() => PaginatedDataTable(
                sortColumnIndex: 0,
                // sortAscending: sort,
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.formFieldC,
                            decoration: const InputDecoration(labelText: 'Buscar nome', suffixIcon: Icon(Icons.search_outlined),),
                            onChanged: (value) {
                              // setState(() {
                              //   controller.myData = filterData.where((element) => element.solicitante.toString().toUpperCase().contains(value.toUpperCase())).toList();
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                ),
                source: RowSource(
                  context: context,
                  myData: controller.myData,
                  count: controller.myData.length,
                  controller: controller
                ),
                actions: [
                  FilledButton(onPressed: () => createUpdatePriorityDialog(null).then((value) => controller.atualizarItens()), child: const Text('Novo Registro'),)
                ],
                rowsPerPage: 10,
                columnSpacing: 2,
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text("Id",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),),
                  DataColumn(label: Text("Nome", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),),    
                  DataColumn(label: Text("Peso", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),),    
                  DataColumn(label: Text('',),),    
                ],
              ),
            )),
          ],
        ),
      )
    );
  }
}



