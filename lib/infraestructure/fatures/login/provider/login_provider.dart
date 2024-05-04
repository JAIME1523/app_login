import 'package:app_login/infraestructure/fatures/login/services/login_services.dart';
import 'package:app_login/infraestructure/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginProvider extends ChangeNotifier {
  bool _isActive = false;
  TextEditingController lada = TextEditingController();
  TextEditingController number = TextEditingController();
  LoginProvider() {
    lada.text = '52';
  }

  validateForm() {
    if (lada.text.isEmpty || number.text.isEmpty) {
      isActive = false;
      return;
    }
    if (number.text.length < 10) {
      isActive = false;
      return;
    }
    isActive = true;
  }

  Future<bool> postLogin() async {
    try {
      final info = await LoginServices.postLogin('+${lada.text}${number.text}');
      LocalNotificationsService.showSnackbar(info.data['message']);
      if (info.data['code'] != 200) return false;
      return true;
    } catch (e) {
      LocalNotificationsService.showSnackbar('Error intentar mas tarde');
      return false;
    }
  }

  bool get isActive => _isActive;
  set isActive(bool value) {
    _isActive = value;
    notifyListeners();
  }
}
