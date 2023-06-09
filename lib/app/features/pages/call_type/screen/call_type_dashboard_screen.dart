library call_type_dashboard;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/models/setor.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/call_type/call_type_repository.dart';
import 'package:chamados/app/utils/repositories/call_type/call_type_repository_impl.dart';
import 'package:chamados/app/utils/repositories/priority/priority_repository.dart';
import 'package:chamados/app/utils/repositories/priority/priority_repository_impl.dart';
import 'package:chamados/app/utils/repositories/setor/setor_repository.dart';
import 'package:chamados/app/utils/repositories/setor/setor_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:validatorless/validatorless.dart';

part '../components/setor.dart';
part '../components/row_source.dart';
part '../components/save_priority_dialog.dart';
part '../components/save_call_type_dialog.dart';
part '../components/remove_call_type_dialog.dart';

class CallTypeListScreen extends StatefulWidget {
  const CallTypeListScreen({super.key});

  @override
  State<CallTypeListScreen> createState() => _CallTypeListState();
}

class _CallTypeListState extends State<CallTypeListScreen> {

  bool sort = true;
  bool isLoading = true;
  List<CallType> filterData = [], myData = [];
  TextEditingController controller = TextEditingController();
  CallTypeRepository callRepo = CallTypeRepositoryImpl();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // myData.addAll(await callRepo.());
    // filterData.addAll(userList);
    _setLoading();
  }

  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData.sort((a, b) => a.titulo.toString().compareTo(b.titulo.toString()));
      } else {
        filterData.sort((a, b) => b.titulo.toString().compareTo(a.titulo.toString()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tipo de chamados')),
      body: isLoading ? buildLoadingIndicator() : SingleChildScrollView(
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
                          myData = filterData.where((element) => element.titulo.toString().contains(value)).toList();
                        });
                      },
                    ),
                    source: RowSource(
                      context: context,
                      myData: myData,
                      count: myData.length,
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
                          savePriorityDialog(context);
                        },
                        child: const Text('Cadastrar Prioridade'),
                      ),
                    ),
                    addHorizontalSpace(10),                    
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          saveSetorDialog(context);
                        },
                        child: const Text('Cadastrar Setor'),
                      ),
                    ),
                    addHorizontalSpace(10),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          saveCallTypeDialog(context);
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
      )
    );
  }
}