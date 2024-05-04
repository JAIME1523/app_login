import 'dart:convert';

import 'package:app_login/domain/domain.dart';
import 'package:app_login/infraestructure/fatures/login/login.dart';
import 'package:app_login/infraestructure/shared/services/pref_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  jsonDecode(PrefServices.getString(PrefString.infoJson))
                      .toString()),
            ),
            ElevatedButton(
                onPressed: () async {
                  PrefServices.pref!.clear();
                  await ApiService.getToken();
                  Navigator.pushAndRemoveUntil(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                      (_) => false);
                },
                child: Text('Cerrar sesion'))
          ],
        ),
      ),
    );
  }
}
