library user_dashboard;

import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/features/pages/user/components/edit_user_page.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/repositories/user_repository.dart';
import 'package:chamados/app/utils/repositories/user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part '../components/row_source.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  
  bool sort = true;
  List<UserInfoModel>? filterData, myData;
  
  UserRepository userRepo = UserRepositoryImpl();

  onsortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.email!.compareTo(b.email!));
      } else {
        filterData!.sort((a, b) => b.email!.compareTo(a.email!));
      }
    }
  }

  Future<void> _initializeData() async {
    filterData = await userRepo.getuserList();
    myData = await userRepo.getuserList();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return FutureBuilder<void>(
      future: _initializeData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AlertDialog(
            title: Center(child: Text('Aguarde')),
            content: SizedBox(width: 4, height: 4 , child: CircularProgressIndicator()),
            actions: [
              Center(child: Text('Processando...')),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar os dados: ${snapshot.error}');
        } else {
          return Scaffold(
            appBar: AppBar(title: const Text('Usuários')),
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
                          // myData = filterData!.where((element) => element.email!.contains(value)).toList();
                          });
                        },
                      ),
                      source: RowSource(
                        context: context,
                        myData: myData,
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
      },
    );
  }
}




