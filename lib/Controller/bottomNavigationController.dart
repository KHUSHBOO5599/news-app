import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_app/Pages/HomePage/HomePage.dart';
import 'package:news_app/Pages/Articles/Articles.dart';
import 'package:news_app/Pages/Profile/ProfilePage.dart';


class bottomNavController extends GetxController{

  RxInt index = 0.obs;

  var pages = [
    Homepage(),
    ArticlesPage(),
    ProfilePage(),
  ];
}

