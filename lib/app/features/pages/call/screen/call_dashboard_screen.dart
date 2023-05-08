library call_dashboard;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/features/pages/call/components/call_detail_page.dart';
import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/shared_components/c_appbar.dart';
import 'package:chamados/app/utils/services/user_service.dart';
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
  List<Call>? filterData, myData;
  UserService userSvc = UserServiceImpl();


  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.usuario.email.toString().compareTo(b.usuario.email.toString()));
      } else {
        filterData!.sort((a, b) => b.usuario.email.toString().compareTo(a.usuario.email.toString()));
      }
    }
  }

  @override
  void initState() {
    filterData = userSvc.getCalls();
    myData = userSvc.getCalls();
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Chamados'),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Theme(
                data: ThemeData.light().copyWith(cardColor: Theme.of(context).canvasColor, ),
                child: PaginatedDataTable(
                  sortColumnIndex: 0,
                  sortAscending: sort,
                  header: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Buscar por nome',
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
                        myData = filterData!.where((element) => element.usuario.email.toString().contains(value)).toList();
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
                        "Criado em",
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
                        "Prioridade",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    const DataColumn(
                      label: Text(
                        "Solicitante",
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
                        "Ultima atualizacao",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),                        
                  ],
                ),
              )
            ),
          ),
        ));
  }
}



