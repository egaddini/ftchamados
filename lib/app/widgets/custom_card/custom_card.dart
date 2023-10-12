import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomFlexCard extends StatelessWidget {
  final Function function;
  final Widget content;
  final double width, height;

  const CustomFlexCard({
    Key? key,
    required this.function,
    required this.content,
    this.width = 300,
    this.height = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        child: SizedBox(
          width: width,
          height: height,
          child: content,
        ),
        onTap: () => function(),
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
