import 'package:get/get.dart';

import '../controllers/add_bookmark_controller.dart';

class AddBookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBookmarkController>(
      () => AddBookmarkController(),
    );
  }
}
