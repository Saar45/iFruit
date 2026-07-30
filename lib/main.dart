import 'package:flutter/material.dart';

import 'data/fruits_data.dart';

void main() {
  runApp(const IFruitApp());
}

class IFruitApp extends StatelessWidget {
  const IFruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iFruit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(child: Text('${fruits.length} fruits loaded')),
      ),
    );
  }
}
