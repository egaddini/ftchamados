import 'package:chamados/app/models/call_type.dart';
import 'package:flutter/material.dart';


class CreateCallPage extends StatefulWidget {
  final CallType call;

  CreateCallPage(this.call);

  @override
  _CreateCallPageState createState() => _CreateCallPageState();
}

class _CreateCallPageState extends State<CreateCallPage> {
  late TextEditingController _nameC;
  late TextEditingController _siglaC;
  late TextEditingController _prioridadeC;
  late TextEditingController _descricaoC;
  late TextEditingController _dataAberturaC;
  late TextEditingController _usuarioSolicitanteC;
  late TextEditingController _descreverProblemaC;

  @override
  void initState() {
    super.initState();
    _nameC = TextEditingController(text: widget.call.descricao);
    _siglaC = TextEditingController(text: widget.call.sigla);
    _prioridadeC = TextEditingController(text: widget.call.prioridade);
    _descricaoC = TextEditingController(text: widget.call.descricao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo chamado - ${_siglaC.text} ${_nameC.text}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _siglaC,
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
                    controller: _nameC,
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
              children: [
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
                    decoration: const InputDecoration(
                      labelText: 'Descreva o problema ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                widget.call.descricao = _nameC.text;
                Navigator.pop(context, widget.call);
              },
              child: const Text('Criar chamado'),
            ),
          ],
        ),
      ),
    );
  }
}
