import 'package:flutter/material.dart';

import '../models/fruit.dart';

class FruitDetailView extends StatelessWidget {
  const FruitDetailView({super.key, required this.fruit});

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(fruit.title)),
      body: const Center(child: Text('Detail coming soon')),
    );
  }
}
