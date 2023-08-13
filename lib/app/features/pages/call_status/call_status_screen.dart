library call_status;

import 'package:chamados/app/features/pages/call/components/call_detail_page.dart';
import 'package:chamados/app/features/pages/call_status/call_status_controller.dart';
import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

part 'components/row_source.dart';

class CallStatusScreen extends GetView<CallStatusController>  {

  const CallStatusScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chamados')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            addVerticalSpace(10),
            SizedBox(
              width: double.infinity,
              child: PaginatedDataTable(
                sortColumnIndex: 0,
                // sortAscending: sort,
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.formFieldC,
                    decoration: const InputDecoration(labelText: 'Buscar por Solicitante', suffixIcon: Icon(Icons.search_outlined),),
                    onChanged: (value) {
                      // setState(() {
                      //   controller.myData = filterData.where((element) => element.solicitante.toString().toUpperCase().contains(value.toUpperCase())).toList();
                      // });
                    },
                  ),
                ),
                source: RowSource(
                  context: context,
                  myData: [], //myData,
                  count: 0, //myData.length,
                ),
                checkboxHorizontalMargin: 10,
                rowsPerPage: 10,
                columnSpacing: 6,
                showCheckboxColumn: false,
                columns: [
                  const DataColumn(label: Text("Solicitante",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),),
                  const DataColumn(label: Text("Ultima atualizacao", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),),                        
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}



