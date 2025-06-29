import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/ModelOfNews.dart';

class NewsController extends GetxController {
  RxList<ModelOfNews> trendingNewsList = <ModelOfNews>[].obs;
  RxList<ModelOfNews> newsForYouList = <ModelOfNews>[].obs;
  RxList<ModelOfNews> newsForYou5 = <ModelOfNews>[].obs;
  RxList<ModelOfNews> appleNewsList = <ModelOfNews>[].obs;
  RxList<ModelOfNews> apple5News = <ModelOfNews>[].obs;
  RxList<ModelOfNews> teslaNewsList = <ModelOfNews>[].obs;
  RxList<ModelOfNews> tesla5News = <ModelOfNews>[].obs;
  RxList<ModelOfNews> businessNewsList = <ModelOfNews>[].obs;
  RxList<ModelOfNews> business5News = <ModelOfNews>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isBusinessLoading = false.obs;

  void onInt() async {
    super.onInit();
    getNewsForYou();
    getTrendingNews();
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
  }

  Future<void> getTrendingNews() async {
    isTrendingLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          trendingNewsList.add(ModelOfNews.fromJson(news));
        }
      } else {
        print("Something went wrong in Trending News");
      }
    } catch (ex) {
      print(ex);
    }
    isTrendingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          newsForYouList.add(ModelOfNews.fromJson(news));
        }
        newsForYou5.value = newsForYouList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in Trending News");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getAppleNews() async {
    isAppleLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=apple&from=2025-05-18&to=2025-05-18&sortBy=popularity&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          appleNewsList.add(ModelOfNews.fromJson(news));
        }
        apple5News.value = appleNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in Trending News");
      }
    } catch (ex) {
      print(ex);
    }
    isAppleLoading.value = false;
  }

  Future<void> getTeslaNews() async {
    isTeslaLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=tesla&from=2025-04-19&sortBy=publishedAt&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          teslaNewsList.add(ModelOfNews.fromJson(news));
        }
        tesla5News.value = teslaNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in Trending News");
      }
    } catch (ex) {
      print(ex);
    }
    isTeslaLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBusinessLoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";

    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articles = body["articles"];

        for (var news in articles) {
          businessNewsList.add(ModelOfNews.fromJson(news));
        }
        business5News.value = businessNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in Trending News");
      }
    } catch (ex) {
      print(ex);
    }
    isBusinessLoading.value = false;
  }
}
