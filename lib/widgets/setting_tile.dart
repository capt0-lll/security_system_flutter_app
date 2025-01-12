import 'package:flutter/material.dart';

class SettingTile extends StatefulWidget {
  final String settingName;
  final Object setting;

  SettingTile({super.key, required this.settingName, required this.setting});

  @override
  _SettingTileState createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  late Object setting;
  late String settingName;

  @override
  void initState() {
    super.initState();
    settingName = widget.settingName;
    setting = widget.setting;
  }

  @override
  Widget build(BuildContext context) {
    if (setting is bool) {
      bool value = setting as bool;
      return CheckboxListTile(
          title: Text(settingName),
          value: value,
          onChanged: (value) {
            setting = value!;
            setState(() {});
          });
    } else {
      return ListTile(
        title: Text(settingName),
        trailing: TextField(),
      );
    }
  }
}
