import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigHandling {

  String language = "en";
  ThemeMode theme = ThemeMode.system;

  ConfigHandling() {
    language = getLanguage().toString();
    String themeString = getTheme().toString();
    switch (themeString) {
      case 'light':
        theme = ThemeMode.light;
        break;
      case 'dark':
        theme = ThemeMode.dark;
        break;
      default:
        theme = ThemeMode.system;
    }
  }

  final Future<SharedPreferencesWithCache> _prefs = 
    SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{'theme', 'language'},
      )
    );
  
  Future<void> setTheme(String theme) async {
    final SharedPreferencesWithCache prefs = await _prefs;
    await prefs.setString('theme', theme);
  }
  
  Future<String> getTheme() async {
    final SharedPreferencesWithCache prefs = await _prefs;
    return prefs.getString('theme') ?? "system";
  }
  

  Future<void> setLanguage(String language) async {
    final SharedPreferencesWithCache prefs = await _prefs;
    await prefs.setString('language', language);
  }

  Future<String?> getLanguage() async {
    final SharedPreferencesWithCache prefs = await _prefs;
    return prefs.getString('language');
  }
}