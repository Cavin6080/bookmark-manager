import 'package:get/get.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final listOfMedias = [].obs;
  @override
  void onInit() {
    listenShareMediaFiles();
    super.onInit();
  }

  void listenShareMediaFiles() {
    ReceiveSharingIntent.getInitialMedia().then((value) => listOfMedias.value = value);
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
