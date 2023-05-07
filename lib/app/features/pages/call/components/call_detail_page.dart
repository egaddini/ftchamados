import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/shared_components/c_appbar.dart';
import 'package:chamados/app/shared_components/c_expanded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CallDetailPage extends StatefulWidget {
  final Call call;

  CallDetailPage(this.call);

  @override
  _CallDetailPageState createState() => _CallDetailPageState();
}

class _CallDetailPageState extends State<CallDetailPage> {

  late TextEditingController _tituloC;
  late TextEditingController _siglaC;
  late TextEditingController _setorC;
  late TextEditingController _prioridadeC;
  late TextEditingController _descricaoC;
  final TextEditingController _dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now()));

  @override
  void initState() {
    super.initState();
    _tituloC = TextEditingController(text: widget.call.callType.titulo);
    _siglaC = TextEditingController(text: widget.call.callType.sigla);
    _setorC = TextEditingController(text: widget.call.callType.setor);
    _prioridadeC = TextEditingController(text: widget.call.callType.prioridade);
    _descricaoC = TextEditingController(text: widget.call.callType.descricao);

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
                CustomExpandedTextField(controller: _tituloC, labelText: 'Abertura'),
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _tituloC, labelText: 'Ultima atualização'),
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _tituloC, labelText: 'Solicitante'),
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _tituloC, labelText: 'Status'),                
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _tituloC, labelText: 'Setor'),
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _tituloC, labelText: 'Prioridade'),                
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _tituloC, labelText: 'ID'),                
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _tituloC, labelText: 'Titulo'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _tituloC, labelText: 'Descrição do solicitante', maxLines: 4),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _tituloC, labelText: 'Histórico', maxLines: 6),
              ],
            ),            
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _tituloC, labelText: 'Participantes'),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(child: Expanded(child: Divider())),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _tituloC, labelText: 'Comentar algo', maxLines: 6),
              ],
            ),            
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.call.descricao = _tituloC.text;
                    Navigator.pop(context, widget.call);
                  },
                  child: const Text('Iniciar Chamado'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    widget.call.descricao = _tituloC.text;
                    Navigator.pop(context, widget.call);
                  },
                  child: const Text('Comentar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    widget.call.descricao = _tituloC.text;
                    Navigator.pop(context, widget.call);
                  },
                  child: const Text('Encaminhar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    widget.call.descricao = _tituloC.text;
                    Navigator.pop(context, widget.call);
                  },
                  child: const Text('Finalizar'),
                ),                                                
              ],
            ),
          ],
        ),
      ),
    );
  }
}