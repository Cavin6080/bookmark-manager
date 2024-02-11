import 'package:bookmark_manager/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  List<SharedMediaFile> listOfMedias = [];

  @override
  void onInit() {
    fetchSharedMediaFiles();
    // listenSharedMediaFilesStream();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.HOME);
    });
    super.onInit();
  }

  Future<void> fetchSharedMediaFiles() async {
    ReceiveSharingIntent.getInitialMedia().then((value) => listOfMedias = value).whenComplete(() async {
      Get.offAndToNamed(Routes.ADD_BOOKMARK, arguments: {'url': listOfMedias[0].path});

      // try {
      //   if (listOfMedias.isNotEmpty) {
      //     await Dio().post(
      //         options: Options(
      //           contentType: 'application/json',
      //         ),
      //         'https://directus-supabase.onrender.com/items/bookmarks/',
      //         data: {'url': listOfMedias[0].path}).then((value) => print(value.data));
      //   }
      // } catch (e) {
      //   print(e);
      // }
    });
  }

  Future<void> listenSharedMediaFilesStream() async {
    ReceiveSharingIntent.getMediaStream().listen((event) {
      listOfMedias = event;

      if (listOfMedias.isNotEmpty) {
        print('list of medias type: ${listOfMedias[0].type}');
        print('list of medias mimeType: ${listOfMedias[0].mimeType}');
        print('list of medias message: ${listOfMedias[0].message}');
      }
    });
    try {
      if (listOfMedias.isNotEmpty) {
        await Dio().post(
            options: Options(
              contentType: 'application/json',
            ),
            'https://directus-supabase.onrender.com/items/bookmarks/',
            data: {'url': listOfMedias[0].path}).then((value) => print(value.data));
      }
    } catch (e) {
      print(e);
    }
  }
}
