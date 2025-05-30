import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_settings_model.dart';

const String settingsKey = 'app_settings';

abstract class SettingsLocalDataSource {
  Future<AppSettingsModel?> getSettings();
  Future<void> updateSettings(AppSettingsModel settings);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AppSettingsModel?> getSettings() async {
    final jsonString = sharedPreferences.getString(settingsKey);
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return AppSettingsModel.fromJson(jsonMap);
    }
    return null;
  }

  @override
  Future<void> updateSettings(AppSettingsModel settings) async {
    final jsonString = json.encode(settings.toJson());
    await sharedPreferences.setString(settingsKey, jsonString);
  }
}
