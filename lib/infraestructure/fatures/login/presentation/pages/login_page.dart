// ignore_for_file: use_build_context_synchronously

import 'package:app_login/infraestructure/fatures/login/presentation/pages/confirm_number.dart';
import 'package:app_login/infraestructure/fatures/login/provider/login_provider.dart';
import 'package:app_login/infraestructure/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: const Scaffold(
        body: _BodyLogin(),
      ),
    );
  }
}

class _BodyLogin extends StatelessWidget {
  const _BodyLogin();

  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.sizeOf(context);
    final styleText = Theme.of(context).textTheme;
    final provider = context.watch<LoginProvider>();
    return Stack(
      children: [
        const Positioned(
          top: 0,
          child: TopLogin(),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            width: sizer.width,
            height: sizer.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Inico de sesion',
                      style: styleText.displayMedium,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: sizer.height * 0.05),
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                          child: CustomInputField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2)

                            
                            ],
                            controller: provider.lada,
                            labelText: 'Lada',
                            onChange: (v) => provider.validateForm(),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomInputField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: provider.number,
                            labelText: 'Numero celular',
                            onChange: (v) => provider.validateForm(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sizer.height * 0.05),
                    PrimaryButton(
                      width: sizer.width,
                      height: 45,
                      title: 'Acceder',
                      ischarge: true,
                      onPressed: provider.isActive
                          ? () async {
                              final info = await provider.postLogin();
                              if (!info) return;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ConfirmNumberPage(
                                          number:'+${provider.lada.text}${provider.number.text}')));
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
