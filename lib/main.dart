import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_storage/shared_preferences.dart';
import 'package:local_storage/shared_preferences/models.dart';
import 'package:local_storage/shared_preferences/preferences_service.dart';

void main() {
  runApp(const MyApp());
}

// -> Shared Preferences -> Kaydettiğim veriler istediğim gibi geliyor.
// -> Hive -> Local Storage ->
// -> Sqflite

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPreferences(),
    );
  }
}

