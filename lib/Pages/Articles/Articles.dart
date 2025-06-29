import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/Articles/Widgets/SearchWidget.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/NewsDetails/NewsDetails.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20),
              Obx(() => Column(
                children: newsController.newsForYouList.map(
                      (e) => Newstile(
                      ontap: () {
                        Get.to(NewsDetailsPage(news: e));
                      },
                      imageUrl:
                      e.urlToImage ??
                          "https://www.hindustantimes.com/ht-img/img/2025/05/11/550x309/20250508-LKO-DGP-MN-Practice-RCB-010-1_1746931802999_1746931808799.JPG",
                      title: e.title!,
                      author : e.author ?? "Unknown",
                      time: e.publishedAt!
                  ),
                ).toList(),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
