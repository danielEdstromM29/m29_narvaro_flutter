import 'package:flutter/material.dart';
import 'package:m29_narvaro/services/pb.dart';
import 'package:m29_narvaro/services/config_handling.dart';

class EntryPoint extends StatefulWidget{
  const EntryPoint(this._configHandling, {super.key});
  final ConfigHandling _configHandling;

  @override
  State<EntryPoint> createState() => _EntryPointState(_configHandling);
}

class _EntryPointState extends State<EntryPoint> {
  _EntryPointState(this._configHandling);
  final ConfigHandling _configHandling;
  final pb = Pb();
  ThemeMode _themeMode = ThemeMode.system;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  String text = "Hello World";
  String themeText = "Theme: NONE";
  String languageText = "Language: NONE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            Text(themeText),
            Text(languageText),
            ElevatedButton(
                onPressed: () => changeTheme(ThemeMode.light),
                child: Text("Light Theme"),
              ),
            ElevatedButton(
                onPressed: () => changeTheme(ThemeMode.dark),
                child: Text("Dark Theme"),
              ),
          ],
        ),
      ),
    );
  }
}