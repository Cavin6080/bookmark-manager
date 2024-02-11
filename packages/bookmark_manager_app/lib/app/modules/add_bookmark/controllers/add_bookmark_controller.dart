import 'package:bookmark_manager/app/modules/home/controllers/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddBookmarkController extends GetxController {
  final titleController = TextEditingController();
  final urlController = TextEditingController();
  dynamic argumentData = Get.arguments;

  bool isLoading = false;

  @override
  void onInit() {
    if (argumentData != null) {
      urlController.text = argumentData[0]['url'] ?? '';
    }
    super.onInit();
  }

  Future<bool> saveBookmark(String title, String url) async {
    isLoading = true;
    update();
    final result = await Dio().post(
        options: Options(
          contentType: 'application/json',
        ),
        'https://directus-supabase.onrender.com/items/bookmarks/',
        data: {'title': title, 'url': url});

    if (result.statusCode == 400) {
      isLoading = false;
      update();
      return false;
    } else {
      isLoading = false;
      titleController.clear();
      urlController.clear();
      update();
      await Get.find<HomeController>().getBookmarks();
      return true;
    }
  }
}
