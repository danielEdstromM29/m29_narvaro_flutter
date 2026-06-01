import 'dart:async';
import 'package:flutter/material.dart';
import 'package:m29_narvaro/services/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigHandling {
  Languages languages = Languages();
  Map<String, String> language = {};
  ThemeMode theme = ThemeMode.system;

  void setThemeFromString(String themeString) {
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
  

  ConfigHandling() {
    getLanguage();
    getTheme();
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
    setThemeFromString(theme);
  }
  
  Future<void> getTheme() async {
    final SharedPreferencesWithCache prefs = await _prefs;
    final String themeString = prefs.getString('theme') ?? "system";
    setThemeFromString(themeString);
  }
  

  Future<void> setLanguage(String lang) async {
    final SharedPreferencesWithCache prefs = await _prefs;
    await prefs.setString('language', lang);
    language = languages.getLanguage(lang);
  }

  Future<void> getLanguage() async {
    final SharedPreferencesWithCache prefs = await _prefs;
    String lang = prefs.getString('language') ?? "en";
    language = languages.getLanguage(lang);
  }
}