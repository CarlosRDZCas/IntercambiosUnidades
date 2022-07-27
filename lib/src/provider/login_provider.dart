import 'package:flutter/cupertino.dart';

import '../services/services.dart';

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> frmKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _user = '';
  String get user => _user;
  set user(String value) {
    _user = value;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  isValid() {
    return frmKey.currentState?.validate();
  }

  Future<bool> login() async {
    isLoading = true;
    bool logged = false;
    await LoginService.logIn(user, password).then((value) {
      if (value.id == 1) {
        isLoading = false;
        logged = true;
      } else {
        isLoading = false;
        logged = false;
      }
    });
    return logged;
  }
}
