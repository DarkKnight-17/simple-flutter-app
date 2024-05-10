import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/controllers/applications_controller.dart';
import 'package:my_flutter_app/common/extensions/date_time.dart';

class ApplicationList extends StatelessWidget {
  const ApplicationList({super.key});
  @override
  Widget build(BuildContext context) {
    return const _ApplicationList();
  }
}

class _ApplicationList extends GetView<ApplicationsController> {
  const _ApplicationList();

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return ListView.builder(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            final application = state[index];
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.email),
              ),
              title: Text(application.personFullName),
              subtitle: Text(application.date.ago),
            );
          },
        );
      },
      onEmpty: const Center(child: Text('empty')),
      onLoading: const Center(child: CircularProgressIndicator()),
    );
  }
}
