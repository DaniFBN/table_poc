import 'package:flutter/material.dart';

class TableHeaderWidget extends StatelessWidget {
  final int headerCount;
  final Widget Function(BuildContext context, int header) headerBuilder;

  const TableHeaderWidget({
    Key? key,
    required this.headerCount,
    required this.headerBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(headerCount, (header) {
        return headerBuilder(context, header);
      }),
    );
  }
}
