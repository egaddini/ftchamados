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
      return AlertDialog(
        title: const Center(child: Text('Aguarde')),
        content: buildLoadingIndicator(),
        actions: null,
      );
    },
  );
}

void moreDetailsDialog(String titulo, String mensagem) {
  showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: Center(child: Text(titulo, style: Get.theme.textTheme.titleLarge,)),
      content: Text(mensagem),
      actions: [
        Center(
          child: TextButton(
            child: const Icon(Icons.done), 
            onPressed: () => Get.back(closeOverlays: true) ,
          ),
        ),
      ],
    )
  );
}

Future<void> registerSucess(String titulo, String mensagem) {
  return showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      title: Center(child: Text(titulo, style: Get.theme.textTheme.titleLarge,)),
      content: Text(mensagem),
      actions: [
        Center(
          child: TextButton(
            child: const Icon(Icons.done), 
            onPressed: () {     
              Get.back();
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

void tratarErro(DioException e) {
  if (e.response != null && e.response!.data != null) {
    ErrorDTO erro = ErrorDTO.fromMap(e.response!.data);
    if (409.isEqual(erro.status)) snackSucessRegister('Já Registrado', erro.message);
    if (401.isEqual(erro.status)) snackSucessRegister('Credenciais invalidas', erro.message);
    if (403.isEqual(erro.status)) snackSucessRegister('Conta Inativa', erro.message);
  } else {
    snackSucessRegister('Algum problema aconteceu', 'se o problema persistir entre em contato com o suporte \n${e.error}',);
  }
}

Widget buildLoadingIndicator() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: 120,
        width: 250,
        child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                addVerticalSpace(5),
                BlinkText('Carregando...', style: Get.theme.textTheme.titleMedium),
              ],
            )
        ),
      ),
    ],
  );
}

void snackSucessRegister(String title, String message) {
  Get.snackbar(
    title, 
    message, 
    onTap:(snack) => moreDetailsDialog(title, message),
    animationDuration: const Duration(seconds: 2),
    barBlur: 1,
    maxWidth: 1000,
    padding: const EdgeInsets.all(6),
    icon: const Icon(Icons.info),
    margin: const EdgeInsets.all(8),
  );
}

Future<void> waitThreeSeconds() {
  return Future.delayed(const Duration(seconds: 3));
}

Future<bool?> perguntaSimOuNao(String text) async {
  return showDialog(
    context: Get.context!,
    builder: (_) => AlertDialog(
      content: Text(text, style: Get.theme.textTheme.bodyMedium),
      elevation: 4,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: Text("Voltar", style: TextStyle(color: Get.theme.primaryColor),),
            ),
            TextButton(
              onPressed: () => Get.back(result: true),
              child: const Text("Deletar", style: TextStyle(color: Colors.red),),
            ),
          ],
        ),
      ],
    )
  );
}