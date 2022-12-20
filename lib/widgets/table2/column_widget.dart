// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ColumnWidget extends StatefulWidget {
  final int itemCount;
  final void Function(double position) onScrolled;
  final ValueNotifier<double> mainOffset;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const ColumnWidget({
    Key? key,
    required this.onScrolled,
    required this.mainOffset,
    required this.itemBuilder,
    required this.itemCount,
  }) : super(key: key);

  @override
  State<ColumnWidget> createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  final scrollController = ScrollController();

  void listener() {
    widget.onScrolled(scrollController.offset);
  }

  void listener2() async {
    final offset = widget.mainOffset.value;
    scrollController.jumpTo(offset);
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(listener);
    widget.mainOffset.addListener(listener2);
  }

  @override
  void dispose() {
    scrollController.removeListener(listener);
    widget.mainOffset.removeListener(listener2);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Fixed Header'),
          ),
        ),
        // Divider(),
        Expanded(
          child: Theme(
            data: theme.copyWith(
              scrollbarTheme: ScrollbarThemeData(
                thickness: MaterialStateProperty.all(0.0),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Scrollbar(
                child: Column(
                  children: List.generate(widget.itemCount, (index) {
                    return widget.itemBuilder(context, index);
                  }),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
