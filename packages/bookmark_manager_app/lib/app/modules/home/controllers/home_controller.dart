import 'package:bookmark_manager/app/models/bookmark_data_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomeController extends GetxController {
  var listOfMedias = <Data>[];
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getBookmarks();
  }

  /// Used to manage bottom navigation bar on home screen
  changeSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  Future<void> getBookmarks() async {
    final response = await Dio().get('https://directus-supabase.onrender.com/items/bookmarks');
    final parsedResponse = BookmarkDataModel.fromJson(response.data);
    listOfMedias = parsedResponse.data ?? [];
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
