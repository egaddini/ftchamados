import 'package:chamados/app/constans/pallete.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/shared_components/c_appbar.dart';
import 'package:chamados/app/utils/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CreateCallPage extends StatefulWidget {
  final CallType call;

  CreateCallPage(this.call);

  @override
  _CreateCallPageState createState() => _CreateCallPageState();
}

class _CreateCallPageState extends State<CreateCallPage> {

  final UserService userService = UserServiceImpl();
  late TextEditingController _tituloC;
  late TextEditingController _siglaC;
  late TextEditingController _setorC;
  late TextEditingController _prioridadeC;
  late TextEditingController _descricaoC;
  late TextEditingController _descreverProblemaC;
  late TextEditingController _usuarioSolicitanteC;
  final TextEditingController _dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now()));
  //late TextEditingController _usuarioSolicitanteC;
  //late TextEditingController _descreverProblemaC;

  @override
  void initState() {
    super.initState();
    _tituloC = TextEditingController(text: widget.call.titulo);
    _siglaC = TextEditingController(text: widget.call.sigla);
    _setorC = TextEditingController(text: widget.call.setor);
    _prioridadeC = TextEditingController(text: widget.call.prioridade);
    _descricaoC = TextEditingController(text: widget.call.descricao);
    _usuarioSolicitanteC = TextEditingController(text: userService.getLogedUserInfo().email.toString());
    _descreverProblemaC = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Novo chamado - ${_siglaC.text} ${_tituloC.text}'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _setorC,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Setor',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _tituloC,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Titulo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _prioridadeC,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Prioridade',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),                
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descricaoC,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Descrição do chamado',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(child:Divider(),),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [ 
                Expanded(
                  child: TextField(
                    enabled: false,
                    controller: _dataAberturaC,
                    decoration: const InputDecoration(
                      labelText: 'Data de abertura da solicitação',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    enabled: false,
                    controller: _usuarioSolicitanteC,
                    decoration: const InputDecoration(
                      labelText: 'Usuário solicitante',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),                
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descreverProblemaC,
                    maxLines: 10,
                    decoration: const  InputDecoration(
                      contentPadding: EdgeInsets.all(23),
                      labelText: 'Descreva o problema',
                      labelStyle: TextStyle(
                        color: Pallete.backgroundColor
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Pallete.gradient3,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
