import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).whenComplete(
      () {
        Modular.to.navigate('/authentication/');
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Material(
      child: Center(
        child: SizedBox(
          width: width * 0.72,
          child: Image.asset('assets/images/procraft_logo.png'),
        ),
      ),
    );
  }
}
