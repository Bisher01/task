import 'package:bisher_task/controller/update_information_controller.dart';
import 'package:get/get.dart';

class UpdateInformationBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UpdateInformationController());
  }

}