import 'package:flutter/cupertino.dart';

import '../utils/shared_preferences_util.dart';

class RegisterPageViewModel extends ChangeNotifier {
  String _user = '';
  String _password = '';

  get user => _user;
  get password => _password;

  setUser(String user) {
    _user = user;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  savePrefs(String user, String password) async {
    await SharedPrefs.setString('user', user);
    await SharedPrefs.setString('password', password);
    notifyListeners();
  }
}
