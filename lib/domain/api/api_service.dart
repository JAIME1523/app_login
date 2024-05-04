import 'package:app_login/infraestructure/shared/shared.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio();

  static Future configureDio() async {
    _dio.options.baseUrl = "https://api4sun.dudewhereismy.mx/sosroad/";
    await _getToken();
    _dio.options.headers = {
      'Platform': 'default',
      'Authorization': '${PrefServices.getString(PrefString.token)}',
    };
    // _dio.options.validateStatus = (valie) =>  true;
  }

  static Future<Response> httpGet(
      String path, Map<String, dynamic>? data) async {
    try {
      final resp = await _dio.get(path, queryParameters: data);
      return resp;
    } catch (e) {
      throw ('error en el Get');
    }
  }

  static Future<Response> httpPost(
      String path, Map<String, dynamic>? data) async {
    try {
      final resp = await _dio.post(path, queryParameters: data);
      return resp;
    } catch (e) {
      throw ('error en el post');
    }
  }

  static _getToken() async {
    final resp = await _dio.post('token?keycode=Flutt3rTest');
    if (resp.statusCode == 200) {
      await PrefServices.setString(
          PrefString.token, resp.data['data']['Authorized']);
    }
  }
}
