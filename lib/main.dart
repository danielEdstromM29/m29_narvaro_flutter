import 'package:flutter/material.dart';
import 'package:m29_narvaro/components/entry_point/entry_point.dart';
import 'package:m29_narvaro/services/config_handling.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ConfigHandling _configHandling = ConfigHandling();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "M29-Närvaro",
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: EntryPoint(_configHandling),
    );
  }
}

