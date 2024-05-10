import 'package:get/get.dart';
import 'package:my_flutter_app/models/application.dart';

class ApplicationsController extends GetxController
    with StateMixin<List<Application>> {
  List<Application> applications = [];

  void add(Map<String, dynamic> data) async {
    change(null, status: RxStatus.loading());
    final application = Application.fromJson(data);
    applications.add(application);
    change(applications, status: RxStatus.success());
  }

  void initData() async {
    applications.add(Application(
        companyName: 'Stark Industries',
        amountOfMachines: 100,
        email: 'start2012@gmail.com',
        monthlyIncome: 600000,
        kaspiPayAccount: 'KZ64646S654GRR654',
        types: ['Водоматы'],
        personFullName: 'Tony Stark',
        phoneNumber: '+7321654123',
        companyIdentityNumber: '654898123645',
        companyAddress: 'Park Avenue',
        date: DateTime.parse('2020-02-23')));
    await 1.delay();
    change(applications, status: RxStatus.success());
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
