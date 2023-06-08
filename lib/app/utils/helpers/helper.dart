import 'package:blinking_text/blinking_text.dart';
import 'package:chamados/app/models/error_dto.dart';
import 'package:chamados/app/utils/services/local_storage/local_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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

void tratarErro(BuildContext context, DioError e) {
  Navigator.of(context).pop();
  if (e.response != null && e.response!.data != null) {
    ErrorDTO erro = ErrorDTO.fromMap(e.response!.data);
    if (409.isEqual(erro.status)) {
      final snackBar = SnackBar(
        content: Text(erro.message),
        action: SnackBarAction(
          label: 'Ver Mais',
          onPressed: () {
            moreDetailsDialog(context, 'Já Registrado', erro.message);
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } else {
    final snackBar = SnackBar(
      content: const Text('Algum problema aconteceu!'),
      action: SnackBarAction(
        label: 'Ver Mais',
        onPressed: () {
          moreDetailsDialog(context, 'Algum problema aconteceu!', 'se o problema persistir entre em contato com o suporte \n${e.error}');
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Widget buildLoadingIndicator() {
  return SizedBox(
    height: 100,
    width: 100,
    child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            addVerticalSpace(5),
            const BlinkText('Carregando...'),
          ],
      ),
    ),
  );
}

void snackSucessRegister(BuildContext context, String message) {
    final snackBar = SnackBar(
    content: const Text('Registrado com Sucesso!'),
    action: SnackBarAction(
      label: 'Ver Mais',
      onPressed: () {
        moreDetailsDialog(context, 'Registrado com Sucesso', message);
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}