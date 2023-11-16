import 'package:chamados/app/modules/user/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'package:chamados/core/utils/helper.dart';
import 'package:chamados/core/utils/validators/validators.dart';

import '../../../data/models/sector_model.dart';
import '../../../data/models/user_info_model.dart';
import '../../../widgets/c_password_field.dart';
import '../../../widgets/c_text_form_field.dart';
import 'user_details_dialog_controller.dart';

Future<void> userDetailsDialog(UserInfoModel user, UserRepository repository) {
  Get.lazyPut(() => UserDetailsDialogController(user, repository));
  return showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
    titlePadding: const EdgeInsets.only(top: 8, bottom: 0),
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    title: AppBar(
      title: Text(user.email!),
      forceMaterialTransparency: true,
    ),
    content: const SizedBox(
      width: 700,
      child: EditUserPageBody(),
    ),
  )).then((value) => Get.delete<UserDetailsDialogController>());
}

class EditUserPageBody extends GetView<UserDetailsDialogController> {
  
  const EditUserPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            AvatarField(text: controller.emailEC.toString().substring(0, 2).toUpperCase()),
            addVerticalSpace(30),
            Visibility(
              visible: controller.isAdmin.value,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.idEC,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'ID',
                      ),
                    ),
                  ),
                  addHorizontalSpace(10),
                  Expanded(
                    child: TypeAheadField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: controller.roleEC,
                        decoration: const InputDecoration(
                          labelText: 'Cargo',
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                      suggestionsCallback: (pattern) {
                        return controller.roles;
                      },
                      itemBuilder: (context, String cargo) {
                        return ListTile(
                          title: Text(cargo),
                        );
                      },
                      onSuggestionSelected: (String cargo) async {
                        controller.roleEC.text = cargo;
                      },
                    ),
                  ),
                ],
              )
            ),
            // addVerticalSpace(10),
            // dropDownButton(controller.sectors, controller.selectedItens),
            addVerticalSpace(10),
            Form(
                key: controller.generalKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: controller.firstNameEC,
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                            ),
                            validator: Validatorless.required(
                                'Nome Obrigatório'),
                          ),
                        ),
                        addHorizontalSpace(10),
                        Flexible(
                          child: TextFormField(
                            controller: controller.lastNameEC,
                            decoration: const InputDecoration(labelText: 'Sobrenome'),
                            validator: Validatorless.required('Sobrenome Obrigatório'),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    CustomTextFormField(
                      controller: controller.emailEC,
                      labelText: 'Email',
                      validator: [
                        Validatorless.required('Email obrigatório'),
                        Validatorless.email('Email invalido'),
                      ]
                    ),
                  ],
                )
              ),
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: controller.isAdmin.value,
                  child: CheckBoxField(email: controller.emailEC.text, isActive: controller.user.active!)
                ),
                TextButton(child: const Text('Setores', style: TextStyle(fontSize: 20)), onPressed: () {},)
              ],
            ),
            addVerticalSpace(10),
            Visibility(
              visible: controller.logedUser.isUser(),
              child: ExpansionTile(
                title: const Text('Alterar Senhas'),
                children: [
                  Form(
                    key: controller.passwordKey,
                    child: Column(
                      children: [
                        addVerticalSpace(4),
                        PasswordField(
                          labelText: "Senha Atual",
                          controller: controller.senhaAtualEC,
                          validator: [
                            Validatorless.required('É obrigatório inserir a Senha Atual'),
                            Validatorless.min(6, 'Senha Atual precisa ter no mínimo 6 caracteres'),
                          ]
                        ),
                        addVerticalSpace(10),
                        PasswordField(
                            labelText: "Nova Senha",
                            controller: controller.passwordEC,
                            validator: [
                              Validatorless.required( 'A Nova Senha é obrigatória'),
                              Validatorless.min(6, 'A Nova Senha precisa ter no mínimo 6 caracteres'),
                              Validators.difere(controller.senhaAtualEC, 'A Nova Senha precisa ser diferente da atual'),
                            ]),
                        addVerticalSpace(10),
                        PasswordField(
                          labelText: 'Confirmar Nova Senha',
                          controller: controller.confirmPasswordEC,
                          validator: [
                            Validatorless.required('Confirmar nova Senha obrigatória'),
                            Validatorless.min(6, 'Confirmar Senha precisa ter no mínimo 6 caracteres'), Validators.compare(controller.passwordEC,'As Senhas não conferem'),
                          ]
                        ),
                      ],
                    )
                  ),  
                  addVerticalSpace(15),
                ],
              ),
            ),
            addVerticalSpace(15),
            FilledButton(
              child: const Text('Alterar Usuário'),
              onPressed: () => controller.alterarUsuario(),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarField extends StatelessWidget {
  final String text;

  const AvatarField({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Get.theme.primaryColor,
      maxRadius: 60,
      child: Text(
        text,
        style: TextStyle(
          color: Get.theme.primaryColor,
          fontSize: 35,
        ),
      ),
    );
  }
}

class CheckBoxField extends StatefulWidget {
  final bool isActive;
  final String email;

  const CheckBoxField({
    super.key,
    required this.isActive,
    required this.email,
  });

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {
  late bool isActive;
  late String email;
  bool isLoading = false;

  // final UserRepository _userRepository = UserRepositoryImpl();

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
    email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isActive,
          onChanged: (value) {
            // setState(() {
            //   isActive = value!;
            //   waitProgressBar(context);
            //   _userRepository.ativaUsuario(email).then((_) {
            //     Navigator.pop(context);
            //     String mensagem;
            //     mensagem = (isActive) ? 'habilitada' : 'desabilitada';
            //     moreDetailsDialog(
            //         'Registrado com sucesso', 'Conta: $email $mensagem.');
            //   }).catchError((error) {
            //     Navigator.pop(context);
            //     tratarErro(error);
            //   });
            // });
          },
        ),
        const Text(
          'Usuário Habilitado',
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}

Widget dropDownButton(List<SectorModel> items, List<SectorModel> selectedItems) {

  final TextEditingController textEditingController = TextEditingController();

  return Obx(
    () => 
    DropdownButtonFormField2<SectorModel>(
      decoration: const InputDecoration(
        labelText: 'Setores',
      ),
      isExpanded: true,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          enabled: false,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final isSelected = selectedItems.contains(item);
              return InkWell(
                onTap: () {
                  isSelected
                      ? selectedItems.remove(item)
                      : selectedItems.add(item);
                  menuSetState(() {});
                },
                child: SizedBox(
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(item.name),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
      value: selectedItems.isEmpty ? null : selectedItems.last,
      onChanged: (value) {},
      selectedItemBuilder: (context) {
        return items.map(
          (item) {
            return Text(
              selectedItems.map((element) => element.name).join(', '),
              maxLines: 1,
            );
          },
        ).toList();
      },
      dropdownSearchData: DropdownSearchData(
        searchController: textEditingController,
        searchInnerWidgetHeight: 50,
        searchInnerWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Busque por um setor...',
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) =>
            item.value.toString().contains(searchValue),
      ),
      onMenuStateChange: (isOpen) {
        if (!isOpen) {
          textEditingController.clear();
        }
      })
    );
}
