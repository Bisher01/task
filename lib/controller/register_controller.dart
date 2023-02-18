import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../network/register_api.dart';
import '../ui/screens/home_screen.dart';
import '../ui/widgets/overlay_loader.dart';
import '../utilities/app_constants.dart';
import '../utilities/shared_preferences.dart';

class RegisterController extends GetxController {
  static RegisterController get find => Get.find();

  RxBool passwordObscure = true.obs;
  RxBool passwordConfirmObscure = true.obs;
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController passwordConfirmCtrl;


  void changePasswordObscure(){
    passwordObscure.value=!passwordObscure.value;
    update();
  }

  void changePasswordConfirmObscure(){
    passwordConfirmObscure.value=!passwordConfirmObscure.value;
    update();
  }

  Future register({
    required BuildContext context,
  }) async {
    OverLayLoader.flickrLoading(context);
    dynamic registerModel = await RegisterApi().data(
      name: nameCtrl.text,
      email: emailCtrl.text,
      phone: phoneCtrl.text,
      countryCode: "+971",
      password: passwordCtrl.text,
      passwordConfirm: passwordConfirmCtrl.text,
    );
    if (registerModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (registerModel!.success!) {
      MySharedPreferences.accessToken = registerModel!.data!.token!;
      MySharedPreferences.phone=registerModel!.data!.phone!;
      MySharedPreferences.email = registerModel!.data!.email!;
      MySharedPreferences.name = registerModel!.data!.name!;
      MySharedPreferences.countryCode= registerModel!.data!.countryCode!;
      MySharedPreferences.userId = registerModel!.data!.id!;
      MySharedPreferences.isLogIn = true;
      Get.offAll(() => const HomeScreen());
    } else if (!registerModel!.success!) {
      Fluttertoast.showToast(msg: registerModel!.message);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    passwordConfirmCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    passwordConfirmCtrl.dispose();
    super.onClose();
  }
}
