import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/shared_components/c_expanded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CallDetailPage extends StatefulWidget {
  final Call call;

  const CallDetailPage(this.call, {super.key});

  @override
  CallDetailPageState createState() => CallDetailPageState();
}

class CallDetailPageState extends State<CallDetailPage> {

  late TextEditingController _dataAberturaC;
  late TextEditingController _ultAtualizacaoC;
  late TextEditingController _solicitanteC;
  late TextEditingController _statusC;
  late TextEditingController _setorC;
  late TextEditingController _prioridadeC;
  late TextEditingController _idC;
  late TextEditingController _tituloC;
  late TextEditingController _descSolicitC;
  late TextEditingController _historicoC;
  late TextEditingController _participantesC;
  late TextEditingController _comentarioC;
  late TextEditingController _siglaC;
  //final TextEditingController _dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.now()));

  @override
  void initState() {
    super.initState();
    _dataAberturaC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(widget.call.dataCriacao)));
    _ultAtualizacaoC = TextEditingController(text: DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(widget.call.dataUltAtualizacao)));
    _solicitanteC = TextEditingController(text: widget.call.solicitante!.email);
    _statusC = TextEditingController(text: widget.call.status);
    _setorC = TextEditingController(text: widget.call.callType!.setor.nome);
    _prioridadeC = TextEditingController(text: widget.call.callType!.prioridade.nome);
    _idC = TextEditingController(text: widget.call.id.toString());
    _tituloC = TextEditingController(text: widget.call.callType!.titulo);
    _descSolicitC = TextEditingController(text: widget.call.descricao);
    _historicoC = TextEditingController(text: 'Não implementei ainda');
    // _participantesC = TextEditingController(text: widget.call.participant);
    _comentarioC = TextEditingController(text: 'Não implementei ainda');
    _siglaC = TextEditingController(text: widget.call.callType!.setor.sigla);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo chamado - ${_siglaC.text} ${_tituloC.text}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _dataAberturaC, labelText: 'Abertura'),
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _ultAtualizacaoC, labelText: 'Ultima atualização'),
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _solicitanteC, labelText: 'Solicitante'),
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _statusC, labelText: 'Status'),                
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _setorC, labelText: 'Setor'),
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _prioridadeC, labelText: 'Prioridade'),                
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _idC, labelText: 'ID'),                
                const SizedBox(width: 10),
                CustomExpandedTextField(controller: _tituloC, labelText: 'Titulo'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _descSolicitC, labelText: 'Descrição do solicitante', maxLines: 4),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _historicoC, labelText: 'Histórico', maxLines: 6),
              ],
            ),            
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _participantesC, labelText: 'Participantes'),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(child: Expanded(child: Divider())),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomExpandedTextField(controller: _comentarioC, labelText: 'Comentar algo', maxLines: 6),
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