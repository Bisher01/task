import 'package:bisher_task/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../network/login_api.dart';
import '../ui/widgets/overlay_loader.dart';
import '../utilities/app_constants.dart';
import '../utilities/shared_preferences.dart';

class LoginController extends GetxController {
  static LoginController get find => Get.find();

  RxBool passwordObscure = true.obs;
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;

  void changePasswordObscure(){
    passwordObscure.value=!passwordObscure.value;
    update();
  }

  Future login({
    required BuildContext context,
  }) async {
    if(emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty){
      Fluttertoast.showToast(msg: 'Enter your email and password');
    }
    else{
    OverLayLoader.flickrLoading(context);
    dynamic loginModel = await LoginApi().data(
      email: emailCtrl.text,
      password: passwordCtrl.text,
    );
    if (loginModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (loginModel!.success!) {
      MySharedPreferences.accessToken = loginModel!.data!.token!;
      MySharedPreferences.phone = loginModel!.data!.phone!;
      MySharedPreferences.email = loginModel!.data!.email!;
      MySharedPreferences.name = loginModel!.data!.name!;
      MySharedPreferences.countryCode= loginModel!.data!.countryCode!;
      MySharedPreferences.userId = loginModel!.data!.id!;
      MySharedPreferences.isLogIn = true;
      Get.offAll(() => const HomeScreen());
    } else if (!loginModel!.success!) {
      Fluttertoast.showToast(msg:  loginModel!.message!);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }}

  @override
  void onInit() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }
}
