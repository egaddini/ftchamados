import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CallSolverStatisticsScreenController extends GetxController {
  
  final RxString selectedDate = 'diario'.obs, selectedGroup = 'geral'.obs;
  final RxBool isDateFieldVisible = true.obs;
  TextEditingController dateController = TextEditingController();

  RxMap<String, double> dataMapGeral = <String, double>{}.obs;

  @override
  void onInit() {
    dataMapGeral = dataMap.obs;
    super.onInit();
  }

  final List<ButtonSegment> dateSegments = const [
    ButtonSegment(
      value: 'diario',
      label: Text('Diario'),
    ),
    ButtonSegment(
      value: 'mensal',
      label: Text('Mensal'),
    ),
    ButtonSegment(
      value: 'anual',
      label: Text('Anual'),
    ),
  ];

  final List<ButtonSegment> groupSegments = const [
    ButtonSegment(
      value: 'geral',
      label: Text('Geral'),
    ),
    ButtonSegment(
      value: 'meus',
      label: Text('Minhas'),
    ),
  ];

  Map<String, double> dataMap = {
    'Muito Baixa': 1,
    'Baixa': 1,
    'Média Baixa': 1,
    'Média': 4,
    'Média Alta': 2,
    'Alta': 5,
    'Muito Alta': 5,
    'Crítica': 1,
    'Urgente': 1,
    'Emergência': 1,
  };

    Map<String, double> dataMapMensal = {
    'Muito Baixa': 4,
    'Baixa': 7,
    'Média Baixa': 12,
    'Média': 42,
    'Média Alta': 7,
    'Alta': 8,
    'Muito Alta': 8,
    'Crítica': 2,
    'Urgente': 2,
    'Emergência': 1,
  };

  Map<String, double> dataMapAnual = {
    'Muito Baixa': 8,
    'Baixa': 14,
    'Média Baixa': 40,
    'Média': 80,
    'Média Alta': 72,
    'Alta': 82,
    'Muito Alta': 63,
    'Crítica': 24,
    'Urgente': 25,
    'Emergência': 6,
  };



final colorList = const <Color>[
  Color(0xffadd8e6),   
  Color(0xff1e90ff),   
  Color(0xff98fb98),   
  Color(0xff00ff00),   
  Color.fromARGB(255, 240, 218, 93),   
  Color.fromARGB(255, 231, 168, 51),   
  Color.fromARGB(255, 231, 100, 52),   
  Color.fromARGB(255, 180, 97, 3),   
  Color.fromARGB(255, 212, 60, 25),   
  Color.fromARGB(255, 206, 21, 0),   
];



final gradientList = <List<Color>>[
  [
    const Color.fromRGBO(223, 250, 92, 1),
    const Color.fromRGBO(129, 250, 112, 1),
  ],
  [
    const Color.fromRGBO(129, 182, 205, 1),
    const Color.fromRGBO(91, 253, 199, 1),
  ],
  [
    const Color.fromRGBO(175, 63, 62, 1.0),
    const Color.fromRGBO(254, 154, 92, 1),
  ],
  [
    const Color.fromRGBO(255, 0, 0, 1),    
    const Color.fromRGBO(255, 128, 0, 1),  
  ],
  [
    const Color.fromRGBO(255, 165, 0, 1),  
    const Color.fromRGBO(255, 255, 0, 1),  
  ],
  [
    const Color.fromRGBO(255, 0, 255, 1),  
    const Color.fromRGBO(128, 0, 128, 1),  
  ],
  [
    const Color.fromRGBO(255, 0, 255, 1),  
    const Color.fromRGBO(128, 0, 128, 1),  
  ],
  [
    const Color.fromRGBO(255, 0, 0, 1),    
    const Color.fromRGBO(255, 128, 0, 1),  
  ],
  [
    const Color.fromRGBO(255, 0, 0, 1),    
    const Color.fromRGBO(255, 128, 0, 1),  
  ],
  [
    const Color.fromRGBO(255, 0, 0, 1),    
    const Color.fromRGBO(255, 128, 0, 1),  
  ],
];

  setDate() {
    showDatePicker(
        context: Get.context!,
          initialDate: DateTime.now(), 
        firstDate:DateTime(2000), 
        lastDate: DateTime(2101)
    ).then((value) {
      if(value != null ){
        String formattedDate = DateFormat('dd/MM/yyyy').format(value); 
          
        dateController.text = formattedDate; 
      }
    });
  } 
}
    

    
  

  
