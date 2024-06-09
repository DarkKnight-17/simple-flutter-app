import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/features/list_pages/extensions/date_time.dart';
import 'package:my_flutter_app/features/list_pages/controllers/applications_controller.dart';

class ApplicationList extends GetView<ApplicationsController> {
  ApplicationList({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return ListView.builder(
          controller: controller.scrollController,
          itemCount: state!.length + 1,
          itemBuilder: (context, index) {
            if (index < state.length) {
              final application = state[index];
              return Slidable(
                startActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                    icon: Icons.delete,
                    backgroundColor: Colors.red.shade600,
                    onPressed: (_) => controller.remove(application.id),
                  )
                ]),
                child: ListTile(
                  onTap: () {
                    Get.toNamed('/applicationFormPage',
                        arguments: {'doc': application, 'inEditingMode': true});
                  },
                  leading: const CircleAvatar(
                    child: Icon(Icons.email),
                  ),
                  title: Text(
                      application.personFullName + '  ' + index.toString()),
                  subtitle: Text(application.datetime.ddmmyyyy),
                  trailing: const Icon(Icons.arrow_right),
                ),
              );
            } else {
              if (controller.hasMoreData) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return null;
              }
            }
          });
    },
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Center(
          child: Text('No Applications yet'),
        ),
        onError: (error) => Center(child: Text(error!)));
  }
}
