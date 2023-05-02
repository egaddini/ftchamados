import 'package:chamados/app/models/call_type.dart';
import 'package:flutter/material.dart';


class CreateCallPage extends StatefulWidget {
  final CallType call;

  CreateCallPage(this.call);

  @override
  _CreateCallPageState createState() => _CreateCallPageState();
}

class _CreateCallPageState extends State<CreateCallPage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.call.descricao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                widget.call.descricao = _nameController.text;
                Navigator.pop(context, widget.call);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
