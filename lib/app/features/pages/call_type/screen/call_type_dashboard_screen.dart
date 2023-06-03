library call_type_dashboard;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/shared_components/c_text_form_field.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

part '../components/row_source.dart';

class CallTypeDashboardScreen extends StatefulWidget {
  const CallTypeDashboardScreen({super.key});

  @override
  State<CallTypeDashboardScreen> createState() => _CallTypeDashboardScreenState();
}

class _CallTypeDashboardScreenState extends State<CallTypeDashboardScreen> {
  bool sort = true;
  List<CallType>? filterData, myData;
  UserService userSvc = UserServiceImpl();


  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.titulo.toString().compareTo(b.titulo.toString()));
      } else {
        filterData!.sort((a, b) => b.titulo.toString().compareTo(a.titulo.toString()));
      }
    }
  }

  @override
  void initState() {
    filterData = userSvc.getAllCallTypes();
    myData = userSvc.getAllCallTypes();
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tipo de chamados')),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Theme(
                    data: ThemeData.light().copyWith(cardColor: Theme.of(context).canvasColor, ),
                    child: PaginatedDataTable(
                      sortColumnIndex: 0,
                      sortAscending: sort,
                      header: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Buscar por Titulo',
                          contentPadding: EdgeInsets.all(23),                     
                          border: OutlineInputBorder(),                      
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Pallete.gradient3,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: Pallete.backgroundColor
                          ),                                                    
                        ),
                        onChanged: (value) {
                          setState(() {
                            myData = filterData!.where((element) => element.titulo.toString().contains(value)).toList();
                          });
                        },
                      ),
                      source: RowSource(
                        context: context,
                        myData: myData,
                        count: myData?.length,
                      ),
        
                      checkboxHorizontalMargin: 10,
                      rowsPerPage: 10,
                      columnSpacing: 6,
                      showCheckboxColumn: false,
                      columns: [
                        const DataColumn(
                          label: Text(
                            "ID",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Sigla",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),                        
                        DataColumn(
                          label: const Text(
                            "Setor",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14
                            ),
                          ),
                          onSort: (columnIndex, ascending) {
                            setState(() {
                              sort = !sort;
                            });
                            onsortColum(columnIndex, ascending);
                          }
                        ),
                        const DataColumn(
                          label: Text(
                            "Titulo",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Prioridade",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "Descrição",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            "",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),                        
                      ],
                    ),
                  )
                ),
                addVerticalSpace(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            addCallType(context);
                          },
                          child: const Text('Cadastrar Tipo de Chamado'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}