import 'package:chamados/app/features/pages/call/components/new_call/new_call_controller.dart';
import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void newCallDialog(CallCategoryModel call) {
  showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: Center(child: Text(call.titulo!, style: const TextStyle(fontWeight: FontWeight.bold),)),
      content: SizedBox(
        width: 600,
        child: NewCallForm(call: call,),
      ),
    )
  ).then((value) => Get.delete<NewCallController>());
}

class NewCallForm extends StatelessWidget {
  
  final CallCategoryModel call;

  const NewCallForm({super.key, required this.call}); 
  
  @override
  Widget build(BuildContext context) {

  final NewCallController controller = Get.put(NewCallController(callCategory: call), permanent: false);

    return controller.isLoading.value ? buildLoadingIndicator() : SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          addVerticalSpace(10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: controller.callCategory.sector!.nome),
                  decoration: const InputDecoration(
                    labelText: 'Setor',
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: controller.callCategory.titulo),
                  decoration: const InputDecoration(
                    labelText: 'Titulo',
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: controller.callCategory.prioridade!.nome),
                  decoration: const InputDecoration(
                    labelText: 'Prioridade',
                  ),
                ),
              ),                
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: controller.callCategory.descricao),                    
                  decoration:const InputDecoration(
                    labelText: 'Descrição do chamado',
                  ),
                ),
              ),
            ],
          ),
          addHorizontalSpace(10),
          const Row(
            children: [
              Expanded(child:Divider(),),
            ],
          ),
          addHorizontalSpace(10),
          Row(
            children: [ 
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: controller.dataAberturaC,
                  decoration: const InputDecoration(
                    labelText: 'Data de abertura da solicitação',
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: controller.emailUsuarioC,                    
                  decoration: const InputDecoration(
                    labelText: 'Usuário solicitante',
                  ),
                ),
              ),                
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.descreverProblemaC,
                  maxLines: 10,
                  decoration: const  InputDecoration(
                    labelText: 'Descreva o problema',
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(10),
          FilledButton(child: const Text('Registrar chamado', style: TextStyle(fontSize: 16,),), onPressed: () => controller.onClickNewCall(), ),
        ],
      ),
    );
  }
}