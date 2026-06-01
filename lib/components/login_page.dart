import 'package:flutter/material.dart';
import 'package:m29_narvaro/services/config_handling.dart';
import 'package:m29_narvaro/services/db_management.dart';

class LoginPage extends StatefulWidget {
  final DbManagement db;
  final ConfigHandling configHandling;
  const LoginPage({super.key, required this.db, required this.configHandling});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  String errorMessage = '';

  void navigateToHome() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: widget.configHandling.theme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [                
                TextFormField(
                  decoration: InputDecoration(labelText: widget.configHandling.language['username'] ?? 'Username'),
                  validator: (value) => value == null || value.isEmpty ? widget.configHandling.language['username_required'] ?? 'Username is required' : null,
                  onSaved: (newValue) => username = newValue!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: widget.configHandling.language['password'] ?? 'Password'),
                  obscureText: true,
                  validator: (value) => value == null || value.isEmpty ? widget.configHandling.language['password_required'] ?? 'Password is required' : null,
                  onSaved: (newValue) => password = newValue!,
                ),
                SizedBox(height: 20),
                Text(errorMessage, style: TextStyle(color: Colors.red)),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.db.login(username, password).then((success) {
                        if (success || widget.db.isLoggedIn()) {
                          navigateToHome();
                          // Handle successful login
                        } else {
                          setState(() {
                            errorMessage = widget.configHandling.language['invalid_credentials'] ?? 'Login failed. Please check your credentials.';
                          });
                          // Handle failed login
                        }
                      });
                    }
                  },
                  child: Text(widget.configHandling.language['login'] ?? 'Login'),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}