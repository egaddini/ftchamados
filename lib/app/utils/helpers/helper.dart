import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';


Widget addVerticalSpace(double height){
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width){
  return SizedBox(
    width: width,
  );
}

String formatDate(DateTime dateTime) {
  var today = DateTime.now();
  var difference = dateTime.difference(today);

  return switch (difference) {
    Duration(inDays: 0) => 'today',
    Duration(inDays: 1) => 'tomorrow',
    Duration(inDays: -1) => 'yesterday',
    Duration(inDays: var days) when days > 7 => '${days ~/ 7} weeks from now', // New
    Duration(inDays: var days) when days < -7 => '${days.abs() ~/ 7} weeks ago', // New
    Duration(inDays: var days, isNegative: true) => '${days.abs()} days ago',
    Duration(inDays: var days) => '$days days from now',
  };
}

void waitProgressBar(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Center(child: Text('Aguarde')),
        content: SizedBox(width: 4, height: 4 , child: CircularProgressIndicator()),
        actions: [
          Center(child: Text('Processando...')),
        ],
      );
    },
  );
}

void moreDetailsDialog(BuildContext context, String titulo, String mensagem) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Center(child: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold),)),
      content: Text(mensagem),
      actions: [
        Center(
          child: TextButton(
            child: const Icon(Icons.done), 
            onPressed: () {     
              Navigator.pop(context);
            },
          ),
        ),
      ],
    )
  );
}

void registerSucess(BuildContext context, String titulo, String mensagem) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Center(child: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold),)),
      content: Text(mensagem),
      actions: [
        Center(
          child: TextButton(
            child: const Icon(Icons.done), 
            onPressed: () {     
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    )
  );
}

Future<Map<String, String>> getAuthHeader(bool auth) async {
  String? token = "";
  if (auth) {
    LocalStorageServices localStorage = LocalStorageServices();
    token = await localStorage.getToken();
    return {
      'content-type': 'application/json;',
      'authorization': 'Bearer $token'
    };      
  } else {
    return {
      'content-type': 'application/json;',
    };
  }
}