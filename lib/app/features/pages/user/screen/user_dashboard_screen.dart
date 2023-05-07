library user_dashboard;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/utils/services/user_service.dart';
import 'package:flutter/material.dart';
import '../../../../shared_components/c_appbar.dart';


part '../components/row_source.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  bool sort = true;
  List<UserInfoModel>? filterData, myData;
  UserService userSvc = UserServiceImpl();


  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.email!.compareTo(b.email!));
      } else {
        filterData!.sort((a, b) => b.email!.compareTo(a.email!));
      }
    }
  }

  @override
  void initState() {
    _initializeData();
    super.initState();
  }

  Future<void> _initializeData() async {
    filterData = await userSvc.getAllUsersInfo(context);
    myData = await userSvc.getAllUsersInfo(context);
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: 'Chamados'),
        body: Container(
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
                    labelText: 'Buscar por email',                     
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Pallete.gradient3,
                      ),
                    ),                              
                  ),
                  onChanged: (value) {
                    setState(() {
                      myData = filterData!.where((element) => element.email!.contains(value)).toList();
                    });
                  },
                ),
                source: RowSource(
                  context: context,
                  myData: myData,
                  count: myData?.length,
                ),

                checkboxHorizontalMargin: 10,
                rowsPerPage: 8,
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
        ));
  }
}



