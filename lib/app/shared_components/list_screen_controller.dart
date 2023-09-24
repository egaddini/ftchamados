// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chamados/app/repositories/base_repository.dart';
import 'package:get/get.dart';

abstract class ListScreenController extends GetxController {

  final BaseRepository repository;
  
  ListScreenController({required this.repository});


}
