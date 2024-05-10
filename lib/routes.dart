import 'package:get/get.dart';
import 'package:my_flutter_app/controllers/applications_controller.dart';
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
        binding: BindingsBuilder(() => Get.put(ApplicationsController())),
      ),
      GetPage(
        name: '/thirdPage',
        page: () => ThirdPage(),
      ),
      GetPage(
          name: '/applicationFormPage',
          page: () {
            final controller = Get.find<ApplicationsController>();
            return ApplicationFormPage(controller.add);
          })
    ];
