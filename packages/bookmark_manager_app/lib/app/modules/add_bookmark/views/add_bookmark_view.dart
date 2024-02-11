import 'package:bookmark_manager/app/utils/extensions.dart';
import 'package:bookmark_manager/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_bookmark_controller.dart';

class AddBookmarkView extends GetView<AddBookmarkController> {
  const AddBookmarkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF231651),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/one_save_background_text.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.notifications_active_outlined),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                )
              ],
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                20.h,
                TextField(
                  controller: controller.titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Title', border: OutlineInputBorder(), hintStyle: TextStyle(color: Colors.white)),
                ),
                8.h,
                TextField(
                  controller: controller.urlController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'URL', border: OutlineInputBorder(), hintStyle: TextStyle(color: Colors.white)),
                ),
                18.h,
                CustomButton(
                  onPressed: () async {
                    final isAdded = await controller.saveBookmark(controller.titleController.text, controller.urlController.text);
                    if (isAdded) {
                      Get.snackbar('Saved', 'Your bookmark is saved successfully');
                    } else {
                      Get.snackbar('Error', 'Your bookmark can\'t be saved', backgroundColor: Colors.red);
                    }
                  },
                  color: Colors.white,
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
