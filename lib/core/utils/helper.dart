import 'package:chamados/app/data/models/rest_exception.dart';
import 'package:flutter/material.dart';

import 'package:blinking_text/blinking_text.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:chamados/app/widgets/custom_card/custom_card.dart';

import '../../app/data/services/app_config/service.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
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
    Duration(inDays: var days) when days > 7 =>
      '${days ~/ 7} weeks from now', // New
    Duration(inDays: var days) when days < -7 =>
      '${days.abs() ~/ 7} weeks ago', // New
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
            title: Center(
                child: Text(
              titulo,
              style: Get.theme.textTheme.titleLarge,
            )),
            content: Text(mensagem),
            actions: [
              Center(
                child: TextButton(
                  child: const Icon(Icons.done),
                  onPressed: () => Get.back(closeOverlays: true),
                ),
              ),
            ],
          ));
}

Future<void> registerSucess(String titulo, String mensagem) {
  return showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
            title: Center(
                child: Text(
              titulo,
              style: Get.theme.textTheme.titleLarge,
            )),
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
          ));
}

Map<String, String> getAuthHeader() {
  final config = AppConfigService().to(); 
  return (config.isLogged()) ? {'authorization': 'Bearer ${config.userData().token}'} : {};
}

void tratarErro(DioException? e) {
  if (e!.response != null && e.response!.data != null) {
    switch (e.response!.statusCode!) {
      case 409:
        snackErrorRegister('Já Registrado', e.message!);
        break;
      case 403:
        snackErrorRegister('Credenciais invalidas', e.message!);
        break;
      case 401:
        snackErrorRegister('Conta Inativa', e.message!);
        break;
      default:
        snackErrorRegister('Algum problema aconteceu', 'se o problema persistir entre em contato com o suporte \n${e.error}');
    }
  } else {
    snackErrorRegister('Algum problema aconteceu','se o problema persistir entre em contato com o suporte',
    );
  }
}
tratar(RestException e) async {
  switch (e.statusCode) {
    case 409:
      snackErrorRegister('Já Registrado', e.message);
      break;
    case 403:
      snackErrorRegister('Credenciais invalidas', e.message);
      break;
    case 401:
      snackErrorRegister('Conta Inativa', e.message);
      break;
    default:
      snackErrorRegister('Algum problema aconteceu', 'se o problema persistir entre em contato com o suporte \n${e.message}');
    }
    return null;
} 


Widget buildLoadingIndicator() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomCard.customClickableCard(
          height: 120,
          width: 250,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              addVerticalSpace(5),
              BlinkText('Carregando...',
                  style: Get.theme.textTheme.titleMedium),
            ],
          ),
          function: () {},
        ),
      ],
    ),
  );
}

void snackSucessRegister(String title, String message) {
  Get.snackbar(
    title,
    message,
    isDismissible: true,
    onTap: (snack) => moreDetailsDialog(title, message),
    animationDuration: const Duration(seconds: 2),
    barBlur: 1,
    maxWidth: Get.width * 0.95,
    borderWidth: Get.width * 0.8,
    padding: const EdgeInsets.all(2),
    icon: const Icon(Icons.info),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green[200],
  );
}

void snackErrorRegister(String title, String message) {
  Get.snackbar(
    title,
    message,
    isDismissible: true,
    onTap: (snack) => moreDetailsDialog(title, message),
    animationDuration: const Duration(seconds: 2),
    barBlur: 1,
    maxWidth: Get.width * 0.95,
    borderWidth: Get.width * 0.8,
    padding: const EdgeInsets.all(2),
    icon: const Icon(Icons.info),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red[200],
  );
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
                    child: Text(
                      "Voltar",
                      style: TextStyle(color: Get.theme.primaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.back(result: true),
                    child: const Text(
                      "Deletar",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ));
}
