import 'package:bookmark_manager/app/routes/app_pages.dart';
import 'package:bookmark_manager/app/utils/extensions.dart';
import 'package:bookmark_manager/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset(
                      'assets/images/login_bg.svg',
                      width: MediaQuery.of(context).size.width,
                    )),
                Column(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Image.asset(
                          'assets/images/one_save_background_text.png',
                        ),
                      ),
                    ),
                    const Center(
                        child: Text(
                      'Never lose a link again.',
                      style: TextStyle(color: Colors.white),
                    ))
                  ],
                ),
              ],
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: [
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                12.h,
                const Text('Email'),
                6.h,
                const TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                12.h,
                const Text('Password'),
                6.h,
                const TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                12.h,
                CustomButton(
                  onPressed: () {
                    Get.toNamed(Routes.HOME);
                  },
                  textColor: Colors.white,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
