import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      //TODO: Fix String input
      final TextEditingController textEditingController =
          TextEditingController();

      textEditingController.text = setting.toString();

      TextInputType textInputType;

      TextInputFormatter inputFormatter;
      if (setting is int) {
        textInputType = TextInputType.numberWithOptions(
          signed: false,
        );
        inputFormatter = FilteringTextInputFormatter.digitsOnly;
      } else {
        textInputType = TextInputType.text;
      }

      return ListTile(
          title: Text(settingName),
          trailing: Container(
            height: 80,
            width: 200,
            child: SizedBox(
                height: 50,
                width: 130,
                child: TextField(
                  controller: textEditingController,
                  keyboardType: textInputType,
                  //TODO: Implement settings saving on change
                )),
          ));
    }
  }
}
