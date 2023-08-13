// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFlexCard extends StatelessWidget {

  final Function function;
  final Widget content;

  const CustomFlexCard({
    Key? key,
    required this.function,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Flexible(
      child: Card(
        elevation: 4,
        child: InkWell(
          child: SizedBox(
          width: 300,
          height: 100,
            child: content,
          ),
          onTap: () => function(),
        ),
      ),
    );
  }
}

Widget customFlexCard(Widget content, Function function) {
  return Flexible(
    child: Card(
      elevation: 4,
      child: InkWell(
        child: SizedBox(
        width: 300,
        height: 100,
          child: content,
        ),
        onTap: () => function(),
      ),
    ),
  );
}