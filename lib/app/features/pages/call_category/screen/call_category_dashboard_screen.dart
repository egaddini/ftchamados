library call_type_dashboard;

import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/models/call_type_dto.dart';
import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/models/setor.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/call/call_type/call_type_repository.dart';
import 'package:chamados/app/utils/repositories/call/call_type/call_type_repository_impl.dart';
import 'package:chamados/app/utils/repositories/call/priority/priority_repository.dart';
import 'package:chamados/app/utils/repositories/call/setor/setor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

part '../../call_sector/setor.dart';
part '../components/row_source.dart';
part '../../call_priority/save_priority_dialog.dart';
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
    myData.addAll(await callRepo.getCallTypeList());
    filterData.addAll(myData);
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
      appBar: AppBar(title: const Text('Categoria de chamado')),
      body: isLoading ? Center(child: buildLoadingIndicator()) : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            addVerticalSpace(10),
            SizedBox(
              width: double.infinity,
              child: PaginatedDataTable(
                sortColumnIndex: 0,
                sortAscending: sort,
                header: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Buscar por Titulo',
                    suffixIcon: Icon(Icons.search_outlined),                                                   
                  ),
                  onChanged: (value) {
                    setState(() {
                      myData = filterData.where((element) => element.titulo.toString().toUpperCase().contains(value.toUpperCase())).toList();
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
    );
  }
}