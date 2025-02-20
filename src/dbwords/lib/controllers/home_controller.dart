import 'package:get/get.dart';

class HomeController extends GetxController {
  // 是否已有学习计划
  final hasPlan = false.obs;

  void goToCreatePlan() {
    Get.toNamed('/create-plan');
  }

  void goToViewPlans() {
    Get.toNamed('/view-plans');
  }
}
