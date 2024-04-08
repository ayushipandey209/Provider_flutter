import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

TextEditingController _newusername = TextEditingController();

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("Username : "),
              Text(context.watch<UserProvider>().username)
            ],
          ),
          TextField(
            controller: _newusername,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs;

// Initialize shared preferences
                prefs = await SharedPreferences.getInstance();
                prefs.setString('name', _newusername.text);
                context
                    .read<UserProvider>()
                    .changeUsername(newUserName: _newusername.text);
                FocusManager.instance.primaryFocus?.unfocus();
                _newusername.clear();
              },
              child: Text("Save"))
        ],
      )),
    );
  }
}
