import 'package:flutter/material.dart';
import 'package:table_poc/widgets/table1/table_body_widget.dart';

import 'table_index_widget.dart';

class Table1Widget extends StatelessWidget {
  const Table1Widget({super.key});

  int defineFlex(int headerIndex) {
    if (headerIndex == 0) return 4;
    if (headerIndex == 1 || headerIndex == 2) return 2;
    return 1;
  }
  
  @override
  Widget build(BuildContext context) {
    const headerCount = 5;
    const itemCount = 50;

    return Column(
      children: [
        TableHeaderWidget(
          headerCount: headerCount,
          headerBuilder: (context, index) {
            return Expanded(
              flex: defineFlex(index),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Title $index'),
              ),
            );
          },
        ),
        const Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: TableBodyWidget(
              itemCount: itemCount,
              headerCount: headerCount,
              cellBuilder: (context, dataIndex, headerIndex) {
                return Expanded(
                  flex: defineFlex(headerIndex),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Title $headerIndex'),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
