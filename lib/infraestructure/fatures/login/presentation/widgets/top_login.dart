import 'package:flutter/material.dart';

class TopLogin extends StatelessWidget {
  const TopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.sizeOf(context);

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/fondo-madd.jpg',
              ))),
      width: sizer.width,
      height: sizer.height * 0.7,
      child: Center(
        child: Image.asset(
          'assets/logo.png',
          height: sizer.height * 0.29,
        ),
      ),
    );
  }
}
