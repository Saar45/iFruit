import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/content_view.dart';
import 'screens/fruit_list_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
  runApp(IFruitApp(seenOnboarding: seenOnboarding));
}

class IFruitApp extends StatelessWidget {
  const IFruitApp({super.key, required this.seenOnboarding});

  final bool seenOnboarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iFruit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: seenOnboarding ? const FruitListView() : const ContentView(),
    );
  }
}
