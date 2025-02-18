import 'package:get/get.dart';

class HomeController extends GetxController {
  void onCreatePlanPressed() {
    // 导航到创建学习计划页面
    Get.toNamed('/create-plan');
  }

  void onViewPlanPressed() {
    // 导航到查看学习计划页面
    Get.toNamed('/view-plan');
  }
}