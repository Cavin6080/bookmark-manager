import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddBookmarkController extends GetxController {
  final titleController = TextEditingController();
  final urlController = TextEditingController();

  bool isLoading = false;

  Future<bool> saveBookmark(String title, String url) async {
    isLoading = true;
    update();
    final dio = Dio();
    dio.httpClientAdapter = BrowserHttpClientAdapter();

    final result = await dio.post(
        options: Options(contentType: 'application/json'),
        'https://directus-supabase.onrender.com/items/bookmarks/',
        data: {'title': title, 'url': url});

    if (result.statusCode == 400) {
      isLoading = false;
      update();
      return false;
    } else {
      isLoading = false;
      urlController.clear();
      titleController.clear();
      update();
      return true;
    }
  }
}
