library call_dashboard;

import 'package:chamados/app/features/pages/call/components/call_detail/call_detail_screen.dart';
import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/call/call_repository.dart';
import 'package:chamados/app/repositories/call/call/call_repository_impl.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part '../components/row_source.dart';

class CallDashboardScreen extends StatefulWidget {
  
  const CallDashboardScreen({super.key});

  @override
  State<CallDashboardScreen> createState() => _CallDashboardScreenState();
}

class _CallDashboardScreenState extends State<CallDashboardScreen> {
  
  bool sort = true;
  bool isLoading = true;
  List<Call> filterData = [], myData = [];
  final CallRepository _callRepo = CallRepositoryImpl();

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData.sort((a, b) => a.solicitante!.email.toString().compareTo(b.solicitante!.email.toString()));
      } else {
        filterData.sort((a, b) => b.solicitante!.email.toString().compareTo(a.solicitante!.email.toString()));
      }
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    myData.addAll(await _callRepo.getCallList());
    filterData.addAll(myData);
    _setLoading();
  }

  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chamados')),
      body: isLoading ? Center(child: buildLoadingIndicator()) : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            addVerticalSpace(10),
            SizedBox(
              width: double.infinity,
              child: PaginatedDataTable2(
                actions: [],
                sortColumnIndex: 0,
                sortAscending: sort,
                header: Padding(
                  padding: const EdgeInsets.only(top : 8.0),
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Buscar por Solicitante',
                      suffixIcon: Icon(Icons.search_outlined),                                                   
                    ),
                    onChanged: (value) {
                      setState(() {
                        myData = filterData.where((element) => element.solicitante.toString().toUpperCase().contains(value.toUpperCase())).toList();
                      });
                    },
                  ),
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
                  const DataColumn(label: Text("ID",),),
                  const DataColumn(label: Text("Criado em",),),                        
                  DataColumn(label: const Text("Setor",), onSort: (columnIndex, ascending) {setState(() { sort = !sort;}); onsortColum(columnIndex, ascending);}),
                  const DataColumn(label: Text("Prioridade",),),
                  const DataColumn(label: Text("Solicitante",),),
                  const DataColumn(label: Text("Status",),),                       
                  const DataColumn(label: Text("Ultima atualizacao",),),                        
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}



