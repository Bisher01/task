import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../model/change_password_model.dart';
import '../network/change_password_api.dart';
import '../ui/screens/home_screen.dart';
import '../ui/widgets/overlay_loader.dart';
import '../utilities/app_constants.dart';
import '../utilities/shared_preferences.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get find => Get.find();

  late TextEditingController currentPasswordCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController passwordConfirmCtrl;

  ChangePasswordModel? changePasswordModel;
  Future updatePassword(BuildContext context) async {
    OverLayLoader.flickrLoading(context);
    changePasswordModel = await ChangePasswordApi().data(
      currentPassword: currentPasswordCtrl.text,
      password: passwordCtrl.text,
      passwordConfirm: passwordConfirmCtrl.text,
    );
    if (changePasswordModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (changePasswordModel!.success!) {
      Get.snackbar(
        'Success',
        'Your password is updated successfully',
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(() => const HomeScreen());
    } else {
      Fluttertoast.showToast(msg: changePasswordModel!.message!);
    }
    Loader.hide();

    return ChangePasswordModel;
  }

  @override
  void onInit() {
    currentPasswordCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    passwordConfirmCtrl =
        TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    currentPasswordCtrl.dispose();
    passwordCtrl.dispose();
    passwordConfirmCtrl.dispose();
    super.onClose();
  }
}
