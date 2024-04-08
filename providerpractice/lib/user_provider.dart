import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String? newname;

  UserProvider() {
    // Call SaveData when the provider is initialized
    SaveData();
  }

  void SaveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve the value from SharedPreferences and assign it to newname
    newname = prefs.getString('name');
    // Notify listeners that the value has changed
    notifyListeners();
  }

  String get username => newname ?? ""; // Use getter to access username

  void changeUsername({
    required String newUserName,
  }) {
    newname = newUserName;
    notifyListeners();
  }
}



// //first step to create a provider class
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class UserProvider extends ChangeNotifier {
  
//   String username;
//   UserProvider({this.username = "Mapp"});

//   void changeUsername({
//     required String newUserName,
//   }) async {
//     username = newUserName;
//     notifyListeners();
//   }
// }
