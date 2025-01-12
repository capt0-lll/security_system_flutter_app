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
        itemCount: Settings.length,
        itemBuilder: (context, index) {
          final Setting setting = Settings[index];
          return SettingTile(
              setting: setting.setting, settingName: setting.settingName);
        });
  }
}
