import 'package:flutter/material.dart';

class MenuItem {
  
  final String text;
  final IconData icon;
  final Function function;
  
  const MenuItem({
    required this.text,
    required this.icon,
    required this.function
  });

}