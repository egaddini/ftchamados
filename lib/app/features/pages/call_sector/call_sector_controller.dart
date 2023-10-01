import 'package:chamados/app/models/sector_model.dart';
import 'package:chamados/app/shared_components/custom_data_table/custom_paginated_data_table2.controller.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:chamados/app/repositories/call/setor/setor_repository.dart';
import 'package:get/get.dart';

class CallSectorController extends CustomPaginatedDataTable2Controller<SectorModel> {
  
  bool sort = true;
  final SectorRepository _sectorRepository;

  CallSectorController(this._sectorRepository);

  @override
  void onInit() {
    _sectorRepository.getList().then((value) => {
      data.value = value,
      isLoading = false.obs
    });
    super.onInit();
  }

  void deleteItem(int index) async {
    SectorModel sector = data[index];
    bool? deleta = await perguntaSimOuNao('Deseja remover o Status: ${sector.name}');
    if (deleta != null && deleta) {
      _sectorRepository.delete(sector.id!).then((_) {
        data.removeAt(index);
        data.refresh();
        snackSucessRegister('Registrado com sucesso', 'Status ${sector.name} Deletado com sucesso!');
      }).catchError((error) {
        Get.back();
        tratarErro(error);
      }); 
    }
  }

  Future<bool> atualizarItens() async {
    await Future.delayed(const Duration(milliseconds: 500));
    data.value = await _sectorRepository.getList();
    data.refresh();
    return true;
  }
}