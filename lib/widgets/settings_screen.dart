import 'package:flutter/material.dart';
import '../models/settings.dart';
import '../models/setting.dart';
import './setting_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: settings.length,
        itemBuilder: (context, index) {
          final Setting setting = settings[index];

          return SettingTile(
            settingName: setting.settingName,
            setting: setting.setting,
          );
        });
  }
}
