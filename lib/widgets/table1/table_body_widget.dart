import 'package:flutter/material.dart';

class TableBodyWidget extends StatelessWidget {
  final int headerCount;
  final int itemCount;
  final Widget Function(BuildContext context, int dataIndex, int headerIndex)
      cellBuilder;

  const TableBodyWidget({
    Key? key,
    required this.itemCount,
    required this.headerCount,
    required this.cellBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(itemCount, (itemIndex) {
        return Row(
          children: List.generate(headerCount, (headerIndex) {
            return cellBuilder(context, itemIndex, headerIndex);
          }),
        );
      }),
    );
  }
}
