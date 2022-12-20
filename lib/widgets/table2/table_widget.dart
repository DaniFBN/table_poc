// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'column_widget.dart';

class Table2Widget extends StatefulWidget {
  final int itemCount;
  final int columnCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const Table2Widget({
    Key? key,
    required this.itemCount,
    required this.columnCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  State<Table2Widget> createState() => _Table2WidgetState();
}

class _Table2WidgetState extends State<Table2Widget> {
  late final ValueNotifier<double> mainOffset;

  @override
  void initState() {
    super.initState();

    mainOffset = ValueNotifier<double>(0);
  }

  void animateTo(double offset) {
    mainOffset.value = offset;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.columnCount, (index) {
        return Expanded(
          child: ColumnWidget(
            itemCount: widget.itemCount,
            mainOffset: mainOffset,
            onScrolled: animateTo,
            itemBuilder: widget.itemBuilder,
          ),
        );
      }),
    );
  }
}
