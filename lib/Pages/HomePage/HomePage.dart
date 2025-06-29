import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/HomePage/Widgets/TrendingCard.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/NewsDetails/NewsDetails.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(Icons.dashboard),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Text(
                    "NEWS APP",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      newsController.getTrendingNews();
                      newsController.getNewsForYou();
                      newsController.getTeslaNews();
                      newsController.getBusinessNews();
                      newsController.getAppleNews();

                    },
                    child: Container(
                      child: Icon(Icons.person),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News For You",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () =>
                        newsController.isTrendingLoading.value
                            ? CircularProgressIndicator()
                            : Row(
                              children:
                                  newsController.newsForYou5
                                      .map(
                                        (e) => TrendingCard(
                                          ontap: () {
                                            Get.to(NewsDetailsPage(news: e));
                                          },
                                          imageUrl:
                                              e.urlToImage ??
                                              "https://www.hindustantimes.com/ht-img/img/2025/05/11/550x309/20250508-LKO-DGP-MN-Practice-RCB-010-1_1746931802999_1746931808799.JPG",
                                          title: e.title!,
                                          author: e.author ?? "Unknown",
                                          tag: "Trending No. 1",
                                          time: e.publishedAt!,
                                        ),
                                      )
                                      .toList(),
                            ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                () =>
                    newsController.isNewsForYouLoading.value
                        ? CircularProgressIndicator()
                        : Column(
                          children:
                              newsController.newsForYou5
                                  .map(
                                    (e) => Newstile(
                                      ontap: () {
                                        Get.to(NewsDetailsPage(news: e));
                                      },
                                      title: e.title!,
                                      imageUrl:
                                          e.urlToImage ??
                                          "https://www.hindustantimes.com/ht-img/img/2025/05/11/550x309/20250508-LKO-DGP-MN-Practice-RCB-010-1_1746931802999_1746931808799.JPG",
                                      author: e.author ?? "Unknown",
                                      time: e.publishedAt!,
                                    ),
                                  )
                                  .toList(),
                        ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tesla News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                () =>
                    newsController.isTeslaLoading.value
                        ? CircularProgressIndicator()
                        : Column(
                          children:
                              newsController.tesla5News
                                  .map(
                                    (e) => Newstile(
                                      ontap: () {
                                        Get.to(NewsDetailsPage(news: e));
                                      },
                                      title: e.title!,
                                      imageUrl:
                                          e.urlToImage ??
                                          "https://www.hindustantimes.com/ht-img/img/2025/05/11/550x309/20250508-LKO-DGP-MN-Practice-RCB-010-1_1746931802999_1746931808799.JPG",
                                      author: e.author ?? "Unknown",
                                      time: e.publishedAt!,
                                    ),
                                  )
                                  .toList(),
                        ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apple News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () =>
                        newsController.isAppleLoading.value
                            ? CircularProgressIndicator()
                            : Row(
                              children:
                                  newsController.apple5News
                                      .map(
                                        (e) => TrendingCard(
                                          ontap: () {
                                            Get.to(NewsDetailsPage(news: e));
                                          },
                                          imageUrl:
                                              e.urlToImage ??
                                              "https://www.hindustantimes.com/ht-img/img/2025/05/11/550x309/20250508-LKO-DGP-MN-Practice-RCB-010-1_1746931802999_1746931808799.JPG",
                                          title: e.title!,
                                          author: e.author ?? "Unknown",
                                          tag: "Trending No. 1",
                                          time: e.publishedAt!,
                                        ),
                                      )
                                      .toList(),
                            ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                    () =>
                newsController.isBusinessLoading.value
                    ? CircularProgressIndicator()
                    : Column(
                  children:
                  newsController.business5News
                      .map(
                        (e) => Newstile(
                      ontap: () {
                        Get.to(NewsDetailsPage(news: e));
                      },
                      title: e.title!,
                      imageUrl:
                      e.urlToImage ??
                          "https://www.hindustantimes.com/ht-img/img/2025/05/11/550x309/20250508-LKO-DGP-MN-Practice-RCB-010-1_1746931802999_1746931808799.JPG",
                      author: e.author ?? "Unknown",
                      time: e.publishedAt!,
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
