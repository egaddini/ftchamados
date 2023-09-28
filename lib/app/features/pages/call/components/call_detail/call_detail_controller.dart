import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/comment_model.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CallDetailController extends GetxController {

  final Call call;
  
  late TextEditingController dataAberturaC = TextEditingController(text: '');
  late TextEditingController ultAtualizacaoC = TextEditingController(text: '');
  late TextEditingController solicitanteC = TextEditingController(text: '');
  RxString statusC = ''.obs;
  late TextEditingController setorC = TextEditingController(text: '');
  late TextEditingController prioridadeC = TextEditingController(text: '');
  late TextEditingController idC = TextEditingController(text: '');
  late TextEditingController tituloC = TextEditingController(text: '');
  late TextEditingController descSolicitC = TextEditingController(text: '');
  late TextEditingController historicoC = TextEditingController(text: '');
  late TextEditingController participantesC = TextEditingController(text: '');
  late TextEditingController comentarioC = TextEditingController(text: '');
  late TextEditingController siglaC = TextEditingController(text: '');
  late TextEditingController responsavelC = TextEditingController(text: '');

  final FocusNode comentar = FocusNode();

  RxList<CommentModel> comments = <CommentModel>[].obs;

  List<String> status = ['Aberto', 'Em Triagem', 'Em Andamento', 'Aguardando Informações', 'Aguardando Aprovação', 'Em Espera', 'Pendente', 'Resolvido com Falha', 'Cancelado', 'Finalizado'
];

  CallDetailController(this.call);

  late UserInfoModel logedUser;

  @override
  void onInit() async {
    dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(call.dataCriacao)));
    ultAtualizacaoC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(call.dataUltAtualizacao)));
    solicitanteC = TextEditingController(text: call.solicitante!.email);
    statusC =  call.status.obs;
    setorC = TextEditingController(text: call.callType!.sector!.name);
    prioridadeC = TextEditingController(text: call.callType!.priority!.name);
    idC = TextEditingController(text: call.id.toString());
    tituloC = TextEditingController(text: call.callType!.title);
    descSolicitC = TextEditingController(text: call.descricao);
    historicoC = TextEditingController(text: '');
    siglaC = TextEditingController(text: call.callType!.sector!.acronym);
    participantesC = TextEditingController(text: ':()');
    comentarioC = TextEditingController(text: '');
    responsavelC = TextEditingController(text: call.responsavel == null ? 'Não atribuido' : call.responsavel!.email);
    logedUser = (await LocalStorageServices().getUser())!;
    super.onInit();
  }

  void addComentario() {
    comments.insert(0, CommentModel(date: DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.now()), message: comentarioC.text, user: logedUser.email!));
    comments.refresh();
    comentarioC.text = '';
  }

  setStatusValue(String call) {
    statusC.value = call;
  }
  
}