import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/settings.dart';
import 'package:providerpractice/user_provider.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            context.watch<UserProvider>().username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              child: Text("NextPage"))
        ],
      ),
    );
  }
}
