import 'package:flutter/material.dart';
import 'package:m29_narvaro/components/app.dart';
import 'package:m29_narvaro/services/config_handling.dart';
import 'package:m29_narvaro/services/db_management.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final ConfigHandling configHandling = ConfigHandling();
  final DbManagement db = DbManagement();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M29 Narvaro',
      home: App(configHandling: configHandling, db: db),
    );
  }
}