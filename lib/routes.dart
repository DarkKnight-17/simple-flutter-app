import 'package:get/get.dart';
import 'package:my_flutter_app/pages/application_form_page.dart';
import 'package:my_flutter_app/pages/home_page.dart';
import 'package:my_flutter_app/pages/second_page.dart';
import 'package:my_flutter_app/pages/third_page.dart';

appPages() => [
      GetPage(
        name: '/home',
        page: () => const HomePage(),
      ),
      GetPage(
        name: '/secondPage',
        page: () => SecondPage(),
      ),
      GetPage(
        name: '/thirdPage',
        page: () => ThirdPage(),
      ),
      GetPage(
        name: '/applicationFormPage',
        page: () => ApplicationFormPage(),
      )
    ];
