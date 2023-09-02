import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/models/call_category_register_model.dart';
import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/models/sector_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/category/call_category_repository.dart';
import 'package:chamados/app/repositories/call/priority/priority_repository.dart';
import 'package:chamados/app/repositories/call/setor/setor_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateCategoryController extends GetxController {

  CallCategoryModel? category;
  final CallCategoryRepository categoryRep = CallCategoryRepository();
  final PriorityRepository _priorityRepository = PriorityRepository();
  final SectorRepository _sectorRepository = SectorRepository();

  List<PriorityModel> priorities = [];
  List<SectorModel> sectors = [];

  final formKey = GlobalKey<FormState>();
  final TextEditingController tituloC = TextEditingController(),
  prioridadeC = TextEditingController(), 
  setorC = TextEditingController(),
  descricaoC = TextEditingController();

  RxBool isLoading = false.obs;
  late Text buttonText;

  bool _parametro = false;

  CreateUpdateCategoryController({this.category,});
  
  @override
  void onInit() async {
    _parametro = validaParametro();
    buttonText = Text(_parametro ? "Adicionar": "Atualizar");
    priorities = await _priorityRepository.getList();
    sectors = await _sectorRepository.getList();
    if (!_parametro) {
        tituloC.text = category!.title!;
        prioridadeC.text = '${category!.priority!.name} - ${category!.priority!.weight}'; 
        setorC.text = '${category!.sector!.acronym} - ${category!.sector!.name}';
        descricaoC.text = category!.description!;
    } else {
      category = CallCategoryModel(id: null, title: null, priority: null, sector: null, description: null);
    }
    super.onInit();
  }

  bool validaParametro() => category == null ? true : false;

  void criarAtualizar() {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      _parametro? saveItem(CallCategoryRegisterModel(title: tituloC.text, description: descricaoC.text, sectorId: category!.sector!.id!, priorityId: category!.priority!.id!)) 
      : saveItem(CallCategoryRegisterModel(title: tituloC.text, description: descricaoC.text, sectorId: category!.sector!.id!, priorityId: category!.priority!.id!));
      // saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value)):
      // saveItem(CallStatusModel(id: null, name: nomeC.text, description: descricaoC.text, weight: int.parse(pesoC.text), notify: notificaC.value));
    }
  }

  void saveItem(CallCategoryRegisterModel category) async {
    var formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      isLoading.value = false;
      categoryRep.registerByRegisterModel(category).then((_) {
        Get.back();
        snackSucessRegister('Registrado com sucesso', 'Categoria ${tituloC.text} registrado com sucesso!');
      }).catchError((error) {
        tratarErro(error);
      });                    
    } 
  }

}
