import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/features/list_pages/page.dart';
import 'package:my_flutter_app/features/list_pages/repos.dart/application_repo.dart';
import 'package:my_flutter_app/models/application.dart';

class ApplicationsController extends GetxController
    with StateMixin<List<Application>> {
  final repo = ApplicationRepo();
  List<Application> _applications = [];
  List<Application> get applications => _applications;
  final scrollController = ScrollController();

  bool get hasMoreData => repo.hasMoreData;
  @override
  void onInit() {
    requestMoreData();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (hasMoreData) {
          requestMoreData();
        }

        print('listener was called');
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();

    super.onClose();
  }

  void requestMoreData() {
    repo.listenToDataRealtime().listen((applicationsData) {
      List<Application>? updatedApplications = applicationsData;
      if (updatedApplications != null && updatedApplications.isNotEmpty) {
        _applications = updatedApplications;
      }
      print('applications length: ' + _applications.length.toString());
      change(_applications, status: RxStatus.success());
    });
  }

  Future addApplication(Map<String, dynamic> data) async {
    await repo.addApplication(data);

    change(_applications, status: RxStatus.success());
    Get.until((route) => Get.currentRoute == '/secondPage');
  }

  void edit(String docID, Map<String, dynamic> newData) async {
    change(null, status: RxStatus.loading());
    await repo.updateApplication(docID, newData);
    change(_applications, status: RxStatus.success());
    Get.until((route) => Get.currentRoute == '/secondPage');
  }

  void remove(String docID) async {
    change(null, status: RxStatus.loading());
    await repo.deleteApplication(docID);
    change(_applications, status: RxStatus.success());
  }
}
