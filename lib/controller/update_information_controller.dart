import 'package:bisher_task/ui/screens/home_screen.dart';
import 'package:bisher_task/utilities/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../model/update_information_model.dart';
import '../network/update_information_api.dart';
import '../ui/widgets/overlay_loader.dart';
import '../utilities/app_constants.dart';

class UpdateInformationController extends GetxController {
  static UpdateInformationController get find => Get.find();

  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;

  UpdateInformationModel? updateInformationModel;
  Future updateInformation(BuildContext context) async {
    OverLayLoader.flickrLoading(context);
    updateInformationModel = await UpdateInformationApi().data(
      name: nameCtrl.text,
      phone: phoneCtrl.text,
      email: emailCtrl.text,
      countryCode: "+971",
    );
    if (updateInformationModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (updateInformationModel!.success!) {
      MySharedPreferences.name = updateInformationModel!.data!.name!;
      MySharedPreferences.phone = updateInformationModel!.data!.phone!;
      MySharedPreferences.email = updateInformationModel!.data!.email!;
      Get.snackbar(
        'Success',
        'Your information is updated successfully',
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(() => const HomeScreen());
    } else {
      Fluttertoast.showToast(msg: updateInformationModel!.message!);
    }
    Loader.hide();

    return updateInformationModel;
  }

  @override
  void onInit() {
    nameCtrl = TextEditingController(text: MySharedPreferences.name);
    emailCtrl = TextEditingController(text: MySharedPreferences.email);
    phoneCtrl = TextEditingController(text: MySharedPreferences.phone);
    super.onInit();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.onClose();
  }
}
