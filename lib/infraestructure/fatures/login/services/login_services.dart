import 'package:app_login/domain/api/api_service.dart';
import 'package:dio/dio.dart';

class LoginServices {
  static Future<Response> postLogin(String phone) async {
    final data = {
      "phone": phone,
      "type": "A",
      "token": 'No Importa para el test',
    };
    return await ApiService.httpPost('/phone', data);
  }

  static Future<Response> confimPin(
      {required String code, required String phone}) async {
    final data = {
      "phone": phone,
      "code": code,
    };
    return await ApiService.httpGet('/phone', data);
  }
}

// curl -X POST "https://api4sun.dudewhereismy.mx/sosroad/phone?token=a&type=A&phone=%2B522342342344"