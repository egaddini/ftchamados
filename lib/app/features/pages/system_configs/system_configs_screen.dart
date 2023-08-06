library system_configs_screen;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'system_settings_controller.dart';

class SystemSettingsScreen extends StatelessWidget {
  
  SystemSettingsScreen({super.key});

  final SystemSettingsController _controller = Get.put(SystemSettingsController());

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text('Configura Sistema')),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Card(
                  child: InkWell(
                    child: const SizedBox(
                    width: 300,
                    height: 100,
                      child: Center(child: Text('Elevated Card')),
                    ),
                    onTap: () {
                      print('oi');
                    },
                  ),
                ),
              ),
              Flexible(
                child: Card(
                  child: InkWell(
                    child: const SizedBox(
                    width: 300,
                    height: 100,
                      child: Center(child: Text('Elevated Card')),
                    ),
                    onTap: () {
                      print('oi');
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Card(
                  child: InkWell(
                    child: const SizedBox(
                    width: 300,
                    height: 100,
                      child: Center(child: Text('Elevated Card')),
                    ),
                    onTap: () {
                      print('oi');
                    },
                  ),
                ),
              ),
              Flexible(
                child: Card(
                  child: InkWell(
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('Elevated Card')),
                    ),
                    onTap: () {
                      print('oi');
                    },
                  ),
                ),
              ),
            ],
          ),                  
        ],
      ),
    );
  }
}