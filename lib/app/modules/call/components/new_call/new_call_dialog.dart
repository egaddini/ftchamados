import 'package:flutter/material.dart';

import 'package:chamados/core/utils/helper.dart';
import 'package:intl/intl.dart';

import 'new_call_controller.dart';

class NewCallForm extends StatelessWidget {

  final NewCallController controller;

  const NewCallForm({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(8),
      title: AppBar(
        title: const Text('asdfaSDf'),
        forceMaterialTransparency: true,
      ),
      content: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: controller.callCategory.sector!.name),
                      decoration: const InputDecoration(
                        labelText: 'Setor',
                      ),
                    ),
                  ),
                  addHorizontalSpace(10),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: controller.callCategory.title),
                      decoration: const InputDecoration(
                        labelText: 'Titulo',
                      ),
                    ),
                  ),
                  addHorizontalSpace(10),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: controller.callCategory.priority!.name),
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
                      controller: TextEditingController(
                          text: controller.callCategory.description),
                      decoration: const InputDecoration(
                        labelText: 'Descrição do chamado',
                      ),
                    ),
                  ),
                ],
              ),
              addHorizontalSpace(10),
              const Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              addHorizontalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now())),
                      decoration: const InputDecoration(
                        labelText: 'Data de abertura da solicitação',
                      ),
                    ),
                  ),
                  addHorizontalSpace(10),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: TextEditingController(text:controller.logedUser.email),
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
                      decoration: const InputDecoration(
                        labelText: 'Descreva o problema',
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              const Divider(
                height: 1,
              ),
              addVerticalSpace(10),
              FilledButton(
                child: const Text(
                  'Registrar chamado',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () => controller.onClickNewCall(),
              ),
            ],
          ),
        ),
      )
    );
  }
}
