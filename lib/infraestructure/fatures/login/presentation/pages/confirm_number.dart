import 'package:app_login/infraestructure/fatures/home/presentation/pages/home_page.dart';
import 'package:app_login/infraestructure/fatures/login/provider/confirm_provider.dart';
import 'package:app_login/infraestructure/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ConfirmNumberPage extends StatelessWidget {
  const ConfirmNumberPage({super.key, required this.number});
  final String number;

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider(
      create: (_) => ConfirmProvider(number),
      child: Builder(builder: (context) {
        final provider = Provider.of<ConfirmProvider>(context);

        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: size.height * 0.3,
                  width: size.width * 0.5,
                  child:  Image.asset('assets/pin2.png', fit: BoxFit.fitHeight,)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Ingresa tu pin',
                style: styleText.displaySmall,
              ),
              Text(
                'Enviamos un código a tu Whatsapp con numero $number.',
                style: styleText.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const _PinPut(),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  ischarge: true,
                  width: size.width,
                  title: 'Continuar',
                  onPressed: provider.isActive
                      ? () async {
                          final info = await provider.getInfo();
                          if (!info) return;
                           Navigator.pushAndRemoveUntil(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomePage()), (_)=> false);
                        }
                      : null)
            ],
          ),
        ));
      }),
    );
  }
}

class _PinPut extends StatelessWidget {
  const _PinPut();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final provider = Provider.of<ConfirmProvider>(context);

    return Pinput(
      controller: provider.pin,
      keyboardType: TextInputType.number,
      length: 6,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      onChanged: (value) => provider.validateForm(),
      defaultPinTheme: PinTheme(
        textStyle: const TextStyle(
          fontSize: 35,
        ),
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          color: colors.secondaryContainer,
          border: Border.all(color: const Color.fromRGBO(196, 196, 196, 1.0)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
