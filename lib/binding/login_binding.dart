import 'package:bisher_task/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }

}