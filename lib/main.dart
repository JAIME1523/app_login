import 'package:app_login/config/config.dart';
import 'package:app_login/infraestructure/fatures/home/presentation/pages/home_page.dart';
import 'package:app_login/infraestructure/fatures/login/login.dart';
import 'package:flutter/material.dart';

import 'domain/domain.dart';
import 'infraestructure/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefServices.configurePref();
  await ApiService.configureDio();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Apptheme().getTheme(),
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: LocalNotificationsService.messagerKey,
        home: PrefServices.getBool(PrefBool.isLogin)== true? const HomePage(): const LoginPage());
  }
}
