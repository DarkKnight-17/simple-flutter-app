import 'package:get/get.dart';
import 'package:my_flutter_app/features/list_pages/controllers/applications_controller.dart';
import 'package:my_flutter_app/features/application_form_page/page.dart';

import 'package:my_flutter_app/features/home_page/page.dart';
import 'package:my_flutter_app/features/list_pages/page.dart';
import 'package:my_flutter_app/features/sign_in_page/page.dart';
import 'package:my_flutter_app/features/third_page/page.dart';

final appPages = [
  GetPage(
    name: '/signInPage',
    page: () => const SignInPage(),
  ),
  GetPage(
    name: '/home',
    page: () => HomePage(),
  ),
  GetPage(
    name: '/secondPage',
    page: () => const SecondPage(),
    binding: BindingsBuilder(() {
      Get.put(ApplicationsController());
    }),
  ),
  GetPage(
    name: '/thirdPage',
    page: () => const ThirdPage(),
  ),
  GetPage(
      name: '/applicationFormPage',
      page: () {
        final controller = Get.find<ApplicationsController>();

        return ApplicationFormPage(controller.addApplication, controller.edit);
      }),
];
