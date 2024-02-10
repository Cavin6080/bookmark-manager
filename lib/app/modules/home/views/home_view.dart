import 'package:bookmark_manager/app/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF231651),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/one_save_background_text.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            20.h,
            GetBuilder<HomeController>(builder: (controller) {
              final list = controller.listOfMedias;
              return ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Text("Index $index"),
                      ],
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
