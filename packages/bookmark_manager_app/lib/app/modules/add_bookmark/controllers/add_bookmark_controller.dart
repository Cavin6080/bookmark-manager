import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddBookmarkController extends GetxController {
  final titleController = TextEditingController();
  final urlController = TextEditingController();
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    if (argumentData != null) {
      urlController.text = argumentData[0]['url'] ?? '';
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> saveBookmark(String title, String url) async {
    final result = await Dio().post(
        options: Options(
          contentType: 'application/json',
        ),
        'https://directus-supabase.onrender.com/items/bookmarks/',
        data: {'title': title, 'url': url});

    if (result.statusCode == 400) {
      return false;
    } else {
      return true;
    }
  }
}
