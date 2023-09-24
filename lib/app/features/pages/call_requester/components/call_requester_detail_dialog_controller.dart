import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/comment_model.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/repositories/call/call/call_repository.dart';
import 'package:chamados/app/repositories/call/call/call_repository_impl.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CallRequesterDetailDialogController extends GetxController {

  final Call call;

  bool isHovered = false;

  late UserInfoModel logedUser;

  late TextEditingController dataAberturaC;
  late TextEditingController ultAtualizacaoC;
  late TextEditingController responsavelC;
  late RxString statusC;
  late TextEditingController setorC;
  late TextEditingController prioridadeC;
  late TextEditingController tituloC;
  late TextEditingController descSolicitC;
  late TextEditingController comentarioC = TextEditingController(text: '');

  final FocusNode comentar = FocusNode();

  RxList<CommentModel> comments = <CommentModel>[].obs;

  CallRequesterDetailDialogController(this.call);

  @override
  void onInit() async {
    dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(call.dataCriacao)));
    ultAtualizacaoC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(call.dataUltAtualizacao)));
    responsavelC = TextEditingController(text: call.responsavel == null ? 'Não definido' : call.responsavel!.email);
    statusC = call.status.obs;
    setorC = TextEditingController(text: call.callType!.sector!.name);
    prioridadeC = TextEditingController(text: call.callType!.priority!.name);
    tituloC = TextEditingController(text: call.callType!.title);
    descSolicitC = TextEditingController(text: call.descricao);
    logedUser = (await LocalStorageServices().getUser())!;
    super.onInit();
  }

  void addComentario() {
    comments.insert(0, CommentModel(date: DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.now()), message: comentarioC.text, user: logedUser.email!));
    comments.refresh();
    comentarioC.text = '';
  }

  void finalizarChamado() async {
    CallRepository repository = CallRepositoryImpl();
    await repository.setStatus(call.id, 10).then((value) {
        statusC.value = value.name;
        statusC.refresh();
        snackSucessRegister('Registrado com sucesso', 'Chamado encerrado com sucesso!');
    }).catchError((error) {tratarErro(error);}); 
  }

  callHistoric() {
    showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        title: Center(child: Text('Histórico do chamado', style: Get.theme.textTheme.headlineMedium!)),
        content: SizedBox(
          width: 1200 ,
          child: historicForm(),
        ),
      )
    );
  }

  Padding historicForm() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns:  [
              DataColumn2(label: Text('Data', style: Get.theme.textTheme.titleMedium!), size: ColumnSize.L,),
              DataColumn2(label: Text('Usuário', style: Get.theme.textTheme.titleMedium!), size: ColumnSize.L,),
              DataColumn2(label: Text('Ação', style: Get.theme.textTheme.titleMedium!), size: ColumnSize.L,),
            ],
            rows: List<DataRow>.generate(
                call.historico.length,
                (index) => DataRow(cells: [
                      DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(call.historico[index].dateTime!)))),
                      DataCell(Text(call.historico[index].user!)),
                      DataCell(Text(call.historico[index].message!)),
                    ]))),
    );
  }

}