import 'package:get/get.dart';

class HomeController extends GetxController {
  void goToCreatePlan() {
    Get.toNamed('/create-plan');
  }

  void goToViewPlans() {
    Get.toNamed('/view-plans');
  }
}