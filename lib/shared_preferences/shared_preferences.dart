import 'package:flutter/material.dart';

import 'models.dart';
import 'preferences_service.dart';

class SharedPreferences extends StatefulWidget {
  const SharedPreferences({super.key});

  @override
  State<SharedPreferences> createState() => _SharedPreferencesState();
}

class _SharedPreferencesState extends State<SharedPreferences> {
  final _usernameController = TextEditingController();
  var _selectedGender = Gender.female;
  var _selectedProgrammingLanguage = Set<ProgrammingLanguages>();
  var _isEmployed = false;
  var _preferencesSaveSettings = PreferencesService();



  @override
  void initState() {
    // initState içerisinde fonksiyonumuzu çağırıyoruz.
    super.initState();
    _preferencesGetData();
  }

  void _preferencesGetData() async {
    // uygulamamız tekrardan çağrıldığında eğer shared da bilgilerim varsa onları seçili olarak getirsin
    final _settings =
        await _preferencesSaveSettings.getSettings(); // ayarlarımı getiriyorum.
    setState(() {
      _usernameController.text = _settings.userName!;
      _selectedGender = _settings.gender!;
      _isEmployed = _settings.isEmployed!;
      _selectedProgrammingLanguage = _settings.programmingLanguages!;
    });
  }

  @override
  

  void _saveSettings() {
    final Settings settings = Settings(
        userName: _usernameController.text,
        gender: _selectedGender,
        programmingLanguages: _selectedProgrammingLanguage,
        isEmployed: _isEmployed);
    print(
        "${settings.userName} + ${settings.gender} + ${settings.programmingLanguages} + ${settings.isEmployed}");
    _preferencesSaveSettings.saveSettings(settings);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Storage'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'UserName',
              ),
            ),
          ),
          RadioListTile(
              title: const Text('Female'),
              groupValue: _selectedGender,
              onChanged: (Gender? value) =>
                  setState(() => _selectedGender = value!),
              value: Gender.female),
          RadioListTile(
              title: const Text('Male'),
              groupValue: _selectedGender,
              onChanged: (Gender? value) =>
                  setState(() => _selectedGender = value!),
              value: Gender.male),
          RadioListTile(
              title: const Text('Other'),
              groupValue: _selectedGender,
              onChanged: (Gender? value) =>
                  setState(() => _selectedGender = value!),
              value: Gender.other),
          CheckboxListTile(
              title: const Text('Dart'),
              value: _selectedProgrammingLanguage
                  .contains(ProgrammingLanguages.dart),
              onChanged: (value) => setState(() {
                    _selectedProgrammingLanguage
                            .contains(ProgrammingLanguages.dart)
                        ? _selectedProgrammingLanguage
                            .remove(ProgrammingLanguages.dart)
                        : _selectedProgrammingLanguage
                            .add(ProgrammingLanguages.dart);
                  })),
          CheckboxListTile(
              title: const Text('Kotlin'),
              value: _selectedProgrammingLanguage
                  .contains(ProgrammingLanguages.kotlin),
              onChanged: (value) => setState(() {
                    _selectedProgrammingLanguage
                            .contains(ProgrammingLanguages.kotlin)
                        ? _selectedProgrammingLanguage
                            .remove(ProgrammingLanguages.kotlin)
                        : _selectedProgrammingLanguage
                            .add(ProgrammingLanguages.kotlin);
                  })),
          CheckboxListTile(
              title: const Text('Swift'),
              value: _selectedProgrammingLanguage
                  .contains(ProgrammingLanguages.swift),
              onChanged: (value) => setState(() {
                    _selectedProgrammingLanguage
                            .contains(ProgrammingLanguages.swift)
                        ? _selectedProgrammingLanguage
                            .remove(ProgrammingLanguages.swift)
                        : _selectedProgrammingLanguage
                            .add(ProgrammingLanguages.swift);
                  })),
          CheckboxListTile(
              title: const Text('Dart'),
              value: _selectedProgrammingLanguage
                  .contains(ProgrammingLanguages.javascript),
              onChanged: (value) => setState(() {
                    _selectedProgrammingLanguage
                            .contains(ProgrammingLanguages.javascript)
                        ? _selectedProgrammingLanguage
                            .remove(ProgrammingLanguages.javascript)
                        : _selectedProgrammingLanguage
                            .add(ProgrammingLanguages.javascript);
                  })),
          SwitchListTile(
              title: const Text('Is Employed'),
              value: _isEmployed,
              onChanged: (value) => setState(() {
                    _isEmployed = value;
                    print(_isEmployed);
                  })),
          TextButton(
              onPressed: _saveSettings, child: const Text('Save Settings'))
        ],
      ),
    );
  }
}