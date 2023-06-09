library call_user_dashboard;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/shared_components/c_expanded_text_field.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/call/call/call_repository.dart';
import 'package:chamados/app/utils/repositories/call/call/call_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part '../components/row_source.dart';
part '../components/call_detail_page.dart';

class CallUserDashboardScreen extends StatefulWidget {
  const CallUserDashboardScreen({super.key});

  @override
  State<CallUserDashboardScreen> createState() => _CallUserDashboardScreenState();
}

class _CallUserDashboardScreenState extends State<CallUserDashboardScreen> {
  
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
                        myData = filterData.where((element) => element.solicitante!.email.toString().contains(value)).toList();
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
                        "Título",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
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
                        "Prioridade",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    const DataColumn(
                      label: Text(
                        "Status",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),                    
                    const DataColumn(
                      label: Text(
                        "Criado em",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    const DataColumn(
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
    );
  }
}



