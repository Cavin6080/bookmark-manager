import 'package:bookmark_manager/app/modules/home/views/account_widget.dart';
import 'package:bookmark_manager/app/modules/home/views/favorites_widget.dart';
import 'package:bookmark_manager/app/modules/home/views/reminders_widget.dart';
import 'package:bookmark_manager/app/routes/app_pages.dart';
import 'package:bookmark_manager/app/utils/extensions.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:link_preview_generator/link_preview_generator.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      final selectedValue = controller.selectedIndex.value;

      return Scaffold(
        backgroundColor: const Color(0xFF231651),
        body: IndexedStack(
          index: selectedValue,
          children: const [
            HomePageWidget(),
            FavoritesWidget(),
            RemindersWidget(),
            AccountWidget(),
          ],
        ),
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: selectedValue,
          items: [
            FlashyTabBarItem(icon: const Icon(Icons.home_outlined), title: const Text('Home')),
            FlashyTabBarItem(
                icon: const Icon(Icons.favorite_border), title: const Text('Favorites')),
            FlashyTabBarItem(icon: const Icon(Icons.event), title: const Text('Reminders')),
            FlashyTabBarItem(
                icon: const Icon(Icons.account_circle_outlined), title: const Text('Account')),
          ],
          onItemSelected: (int value) {
            controller.changeSelectedIndex(value);
          },
        ),
      );
    });
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

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
            20.h,
            Expanded(
              child: GetBuilder<HomeController>(builder: (controller) {
                final list = controller.listOfMedias;
                return ListView.builder(
                  itemCount: list.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinkPreviewGenerator(
                            graphicFit: BoxFit.fitHeight,
                            bodyMaxLines: 7,
                            link: list[index].url ?? '',
                            linkPreviewStyle: LinkPreviewStyle.large,
                            showGraphic: true,
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Get.toNamed(Routes.ADD_BOOKMARK);
          },
          child: const Icon(Icons.add)),
    );
  }
}
