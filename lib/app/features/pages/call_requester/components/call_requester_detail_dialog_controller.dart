import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/comment_model.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/repositories/call/call/call_repository.dart';
import 'package:chamados/app/repositories/call/call/call_repository_impl.dart';
import 'package:chamados/app/shared_components/custom_drop_down_menu_button/custom_dropdown_button.dart';
import 'package:chamados/app/shared_components/custom_drop_down_menu_button/menu_item.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CallRequesterDetailDialogController extends GetxController {

  final Call call;

  RxBool isEditable = false.obs;
  late RxString statusC;
  late UserInfoModel logedUser;
  late TextEditingController descSolicitC;
  late TextEditingController responsavelC;
  late TextEditingController ultAtualizacaoC;
  late TextEditingController comentarioC = TextEditingController(text: '');

  List<MenuItem> itens = [];

  final FocusNode comentar = FocusNode();

  RxList<CommentModel> comments = <CommentModel>[].obs;

  CallRequesterDetailDialogController(this.call);

  @override
  void onInit() async {

    MenuItem edit = MenuItem(text: 'Editar', icon: Icons.edit_outlined, function: () => setEditable());
    MenuItem cancel = MenuItem(text: 'Cancelar', icon: Icons.cancel_presentation_rounded, function: () {});
    MenuItem finish = MenuItem(text: 'Finalizar', icon: Icons.check_box_outlined, function: () {});
    MenuItem historic = MenuItem(text: 'Histórico', icon: Icons.history_outlined, function: (() => callHistoric()));
    MenuItem share = MenuItem(text: 'Compartilhar', icon: Icons.share_outlined, function: () {});
    itens = [edit, finish, cancel, share, historic];

    ultAtualizacaoC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(call.dataUltAtualizacao)));
    responsavelC = TextEditingController(text: call.responsavel == null ? 'Não definido' : call.responsavel!.email);
    statusC = call.status.obs;
    descSolicitC = TextEditingController(text: call.descricao);
    logedUser = (await LocalStorageServices().getUser())!;
    super.onInit();
  }

  setEditable() => isEditable.value = !isEditable.value;

  void addComentario() {
    comments.insert(0, CommentModel(date: DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.now()), message: comentarioC.text, user: logedUser.email!));
    comments.refresh();
    comentarioC.text = '';
  }

  void alterarStatusChamado() async {
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
                (index) => DataRow(
                  cells: [
                    DataCell(Text(DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(call.historico[index].dateTime!)))),
                    DataCell(Text(call.historico[index].user!)),
                    DataCell(Text(call.historico[index].message!)),
                  ]))),
    );
  }

}