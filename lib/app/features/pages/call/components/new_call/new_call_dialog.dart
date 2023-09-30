import 'package:chamados/app/features/pages/call/components/new_call/new_call_controller.dart';
import 'package:chamados/app/models/call_category_model.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void newCallDialog(CallCategoryModel call) {
  showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      title: AppBar(title: Text(call.title!), forceMaterialTransparency: true,),
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: controller.callCategory.sector!.name),
                  decoration: const InputDecoration(
                    labelText: 'Setor',
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: controller.callCategory.title),
                  decoration: const InputDecoration(
                    labelText: 'Titulo',
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: TextEditingController(text: controller.callCategory.priority!.name),
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
                  controller: TextEditingController(text: controller.callCategory.description),                    
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
          const Divider(height: 1,),
          addVerticalSpace(10),
          FilledButton(child: const Text('Registrar chamado', style: TextStyle(fontSize: 16,),), onPressed: () => controller.onClickNewCall(), ),
        ],
      ),
    );
  }
}