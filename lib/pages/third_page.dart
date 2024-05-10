import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_flutter_app/controllers/comment_form_controller.dart';

import '../common/components/comment_form.dart';
import '../common/components/contact_icons.dart';
import '../common/components/person_details.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});

  final controller = Get.put(CommentFormController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: ListView(
          children: [
            PersonDetails(context: context),
            ((controller.currentDropDownValue.value == 'one' ||
                    controller.currentDropDownValue.value == 'two')
                ? ContactIcons(context: context)
                : Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 1,
                                color: Theme.of(context).colorScheme.tertiary),
                            bottom: BorderSide(
                                width: 1,
                                color:
                                    Theme.of(context).colorScheme.tertiary))),
                  )),
            CommentForm(controller: controller),
          ],
        ),
      ),
    );
  }
}
