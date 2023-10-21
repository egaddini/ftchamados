import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masks {

  static getPhoneFormater() => MaskTextInputFormatter(mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  static dateTimeMask(mask) => DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.parse(mask.dataUltAtualizacao));

}
