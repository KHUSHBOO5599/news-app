import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/Components/NavigationBar.dart';
import 'package:news_app/Controller/bottomNavigationController.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    bottomNavController controller = Get.put(bottomNavController());
    return Scaffold(
      floatingActionButton: MyBottomNav(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
