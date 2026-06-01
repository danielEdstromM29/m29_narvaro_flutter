import 'package:flutter/material.dart';
import 'package:m29_narvaro/components/login_page.dart';
import 'package:m29_narvaro/services/config_handling.dart';
import 'package:m29_narvaro/services/db_management.dart';

class App extends StatefulWidget {
  final ConfigHandling configHandling;
  final DbManagement db;
  const App({super.key, required this.configHandling, required this.db});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Map<String, String> language;

  String loginButtonText = "";

  @override
  void initState() {
    super.initState();
    if (!widget.db.isLoggedIn()) {
      loginButtonText = widget.configHandling.language['login'] ?? 'Login';
    } else {
      loginButtonText = widget.configHandling.language['logout'] ?? 'Logout'; 
    }
    
  }

  void loginPressed() {
    if (widget.db.isLoggedIn()) {
      widget.db.logout();
      setState(() {
        loginButtonText = widget.configHandling.language['login'] ?? 'Login';
      });
    } else {
      setState(() {
        loginButtonText = widget.configHandling.language['logout'] ?? 'Logout';
      });
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => 
          LoginPage(
            db: widget.db, 
            configHandling: widget.configHandling)
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M29 Narvaro',
      themeMode: widget.configHandling.theme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('M29 Narvaro'),
          actions: [
            ElevatedButton(
              onPressed: () {
                loginPressed();
              },
              child: Text(loginButtonText),
            ),
          ],
        ),
        body: Center(
          child: Text(widget.configHandling.language['welcome'] ?? 'Welcome to M29 Narvaro'),
        ),
      ),
    );
  }
}