import 'package:flutter/material.dart';

import 'screens/content_view.dart';

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
      home: const ContentView(),
    );
  }
}
