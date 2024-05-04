import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_flutter_app/models/icons_and_details.dart';

class RandomListItems extends StatelessWidget {
  final List<Application> applications;
  final void Function() onTap;
  const RandomListItems({
    super.key,
    required this.applications,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: onTap,
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.email),
            ),
            trailing: const Icon(Icons.arrow_right),
            title: Text(applications[index].personName),
            subtitle: Text(applications[index].applicationTime.toString()),
          );
        },
        itemCount: applications.length,
      ),
    );
  }
}
