library user_dashboard;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/features/pages/user/components/edit_user_page.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/utils/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    filterData = userSvc.getAllUsersInfo();
    myData = userSvc.getAllUsersInfo();
    super.initState();
  }

  /// Future<void> _initializeData() async {
  ///   filterData = await userSvc.getAllUsersInfo(context);
  ///   myData = await userSvc.getAllUsersInfo(context);
  /// }

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
                      labelText: 'Buscar por email',  
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
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),                        
                    DataColumn(
                      label: const Text(
                        "Nome",
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
                        "Sobrenome",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      
                    ),
                    const DataColumn(
                      label: Text(
                        "Cargo",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    const DataColumn(
                      label: Text(
                        "Habilitado",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),                        
                    const DataColumn(
                      label: Text(
                        "Data de Registro",
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



