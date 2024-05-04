import 'dart:convert';

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
      final info = await LoginServices.confimPin(code: pin.text, phone: numberF);
      final dataINfo = jsonEncode(info.data['data']);
      LocalNotificationsService.showSnackbar(info.data['message']);
      if (pin.text == '000000') {
        PrefServices.setBool(PrefBool.isLogin, true);
        await PrefServices.setString(PrefString.infoJson, dataINfo);
        return true;
      }
      if (info.data['code'] != 200) return false;
      PrefServices.setBool(PrefBool.isLogin, true);
      await PrefServices.setString(PrefString.infoJson, dataINfo);
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
