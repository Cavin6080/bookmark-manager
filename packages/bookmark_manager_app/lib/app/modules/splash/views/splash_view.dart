import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF231651),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/one_save_background_text.png',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          const Text(
            'Never lose a link again.',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
