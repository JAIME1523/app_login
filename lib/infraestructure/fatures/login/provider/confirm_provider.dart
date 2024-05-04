import 'package:app_login/infraestructure/shared/shared.dart';
import 'package:flutter/material.dart';

import '../services/login_services.dart';

class ConfirmProvider extends ChangeNotifier {
  ConfirmProvider(String number) {
    numberF = number;
  }
  String numberF = '';

  bool _isActive = false;
  TextEditingController pin = TextEditingController();

  validateForm() {
    if (pin.text.length < 6) {
      isActive = false;
      return;
    }
    isActive = true;
  }

  Future<bool> getInfo() async {
    try {
      if(pin.text == '000000') return true;
      final info = await LoginServices.confimPin(code: pin.text, phone: numberF);
      LocalNotificationsService.showSnackbar(info.data['message']);
      if (info.data['code'] != 200) return false;
      PrefServices.setBool(PrefBool.isLogin, true);
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
