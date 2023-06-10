import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/utils/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewCallScreen extends StatefulWidget {
  final CallType call;

  const NewCallScreen(this.call, {super.key});

  @override
  State<NewCallScreen> createState() => _NewCallScreenState();
}

class _NewCallScreenState extends State<NewCallScreen> {

  late CallType _callType;
  late String _emailUsuario;
  late TextEditingController _descreverProblemaC;
  final TextEditingController _dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now()));
  //late TextEditingController _usuarioSolicitanteC;
  //late TextEditingController _descreverProblemaC;

  @override
  void initState() {
    super.initState();
    _callType =  widget.call;
    //_emailUsuario = userService.getLogedUserInfo().email.toString();
    _descreverProblemaC = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo chamado - ${_callType.setor.nome} ${_callType.titulo}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            addVerticalSpace(10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: _callType.setor.nome),
                    decoration: const InputDecoration(
                      labelText: 'Setor',
                    ),
                  ),
                ),
                addHorizontalSpace(10),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: _callType.titulo),
                    decoration: const InputDecoration(
                      labelText: 'Titulo',
                    ),
                  ),
                ),
                addHorizontalSpace(10),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: _callType.prioridade),
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
                    controller: TextEditingController(text: _callType.descricao),                    
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
                    controller: _dataAberturaC,
                    decoration: const InputDecoration(
                      labelText: 'Data de abertura da solicitação',
                    ),
                  ),
                ),
                addHorizontalSpace(10),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: _emailUsuario),                    
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
                    controller: _descreverProblemaC,
                    maxLines: 10,
                    decoration: const  InputDecoration(
                      labelText: 'Descreva o problema',
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(10),
            FilledButton(
              child: const Text(
                'Registrar chamado',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Chamado Registrado!'),
                    backgroundColor: Pallete.gradient3,
                  ),
                );

                /*var formValid = _formKey.currentState?.validate() ?? false;
                if (formValid) {
                  setState(() {
                    loginModel = LoginModel(
                      email: _emailEC.text,
                      password: _passwordEC.text
                    );
                  });                      
                  String? response = await authRepository.authenticate(loginModel!);
                  if (response != null) {
                    Navigator.pushNamed(context, 'home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('As credenciais informadas não batem. Tente novamente.'),
                        backgroundColor: Pallete.gradient3,
                      ),
                    );
                  }
                  Navigator.pushNamed(context, 'home');
                }*/ 
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
