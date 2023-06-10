library user_dashboard;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/features/pages/user/components/edit_user_page.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/user/user_repository.dart';
import 'package:chamados/app/utils/repositories/user/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part '../components/row_source.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  
  bool isLoading = true;
  bool sort = true;
  List<UserInfoModel> filterData = [], userList = [];
  TextEditingController controller = TextEditingController();
  UserRepository userRepo = UserRepositoryImpl();

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        userList.sort((a, b) => a.email!.compareTo(b.email!));
      } else {
        filterData.sort((a, b) => b.email!.compareTo(a.email!));
      }
    }
  }

  Future<void> _init() async {
    userList.addAll(await userRepo.getuserList());
    filterData.addAll(userList);
    _setLoading();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuários')),
      body: isLoading ? buildLoadingIndicator() : SingleChildScrollView(
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
                    // myData = filterData!.where((element) => element.email!.contains(value)).toList();
                    });
                  },
                ),
                source: RowSource(
                  context: context,
                  myData: userList,
                  count: 2,
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
                  const DataColumn(
                    label: Text(''),
                  ),                                            
                ],
              ),
            )
          ),
        ),
      )
    );
  }
}





