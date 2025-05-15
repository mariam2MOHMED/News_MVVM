import 'package:flutter/material.dart';
import 'package:newshttp/shared/app_theme.dart';
import 'package:newshttp/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  final List<String> items = ['English', 'العربية'];
  String? selectedItem = 'English';
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return
      Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:
            MediaQuery.of(context).size.width*0.33
            ),
            child: Center(
              child:     DropdownButton<String>(
                value: settingProvider.language,

                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 36,
                elevation: 16,

                style: const TextStyle(color: Colors.black,

                    fontSize: 24),


                onChanged: (String? newValue) {
                  settingProvider.changeLang(newValue!);
                  setState(() {
                    selectedItem = newValue!;

                  });
                },
              items: [
                DropdownMenuItem(
                    value: 'en',
                    child: Text("English")),
                DropdownMenuItem(
                    value: 'ar',
                    child: Text("العربية")),
              ],
              ),
            ),
          ),
        ],
      );
  }
}
