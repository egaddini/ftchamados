
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CustomPaginatedDataTable2Controller<T> extends GetxController {

  RxBool isLoading = true.obs;

  RxList<T> data = <T>[].obs;

  TextEditingController searchFieldDataC = TextEditingController();

}