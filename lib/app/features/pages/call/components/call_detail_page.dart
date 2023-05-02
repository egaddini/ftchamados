import 'package:chamados/app/models/call_type.dart';
import 'package:flutter/material.dart';

class CallDetailPage extends StatelessWidget {
  final CallType call;

  const CallDetailPage({
    required this.call,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(call.descricao),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 16),
            Text(
              call.descricao,
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
}