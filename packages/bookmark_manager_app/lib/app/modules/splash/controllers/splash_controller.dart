import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final listOfMedias = [].obs;
  @override
  void onInit() {
    listenShareMediaFiles();
    super.onInit();
  }

  Future<void> listenShareMediaFiles() async {
    ReceiveSharingIntent.getInitialMedia()
        .then((value) => listOfMedias.value = value)
        .whenComplete(() async {
      try {
        await Dio().post(
            options: Options(
              contentType: 'application/json',
            ),
            'http://192.168.43.16:8055/items/bookmarks/',
            data: {'url': 'https://amazon.com'}).then((value) => print(value.data));
      } catch (e) {
        print(e);
      }
    });
  }
}
