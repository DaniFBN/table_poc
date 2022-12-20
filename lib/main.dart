import 'package:flutter/material.dart';

import 'widgets/table1/table_widget.dart';
import 'widgets/table2/table_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Table2Widget(
        columnCount: 3,
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.centerLeft,
            color: index.isOdd ? Colors.white : Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            height: 50,
            width: double.infinity,
            child: Text(
              index == 1 ? 'Data asasasaasasassa $index' : 'Data $index',
            ),
          );
        },
      ),
    );
  }
}
