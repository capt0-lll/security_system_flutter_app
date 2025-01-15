import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/settings.dart';

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
      // Widget when setting is bool

      bool value = setting as bool;
      return CheckboxListTile(
          title: Text(settingName),
          value: value,
          onChanged: (value) {
            setting = value!;
            settings
                .firstWhere((setting) => setting.settingName == settingName)
                .setting = value;
            setState(() {});
          });
    } else if (setting is int) {
      // Widget when setting is int
      TextEditingController textEditingController = TextEditingController();
      textEditingController.text = setting.toString();

      return ListTile(
          title: Text(settingName),
          trailing: SizedBox(
              height: 50,
              width: 130,
              child: TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: textEditingController,
                  onChanged: (value) {
                    settings
                        .firstWhere(
                            (setting) => setting.settingName == settingName)
                        .setting = int.parse(value);
                  })));
    } else if (setting is String) {
      TextEditingController textEditingController = TextEditingController();
      textEditingController.text = setting as String;

      return ListTile(
          title: Text(settingName),
          trailing: SizedBox(
            height: 50,
            width: 130,
            child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  settings
                      .firstWhere(
                          (setting) => setting.settingName == settingName)
                      .setting = value;
                }),
          ));
    } else {
      throw Exception(["Invalid setting type"]);
    }
  }
}
