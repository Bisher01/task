import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../model/delete_account_model.dart';
import '../network/delete_account_api.dart';
import '../ui/screens/welcome_screen.dart';
import '../ui/widgets/overlay_loader.dart';
import '../utilities/app_constants.dart';
import '../utilities/shared_preferences.dart';

class DeleteAccountController extends GetxController{

  DeleteAccountModel? deleteAccountModel;
  Future deleteAccount(BuildContext context) async {
    OverLayLoader.flickrLoading(context);
    deleteAccountModel = await DeleteAccountApi().data();
    if (deleteAccountModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (deleteAccountModel!.success!) {
     MySharedPreferences.clearProfile();
      Get.snackbar(
        'Success',
        'Your account has been deleted successfully',
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
     Get.offAll(()=>const WelcomeScreen());
    } else {
      Fluttertoast.showToast(msg: deleteAccountModel!.message!);
    }
    Loader.hide();
    return deleteAccountModel;
  }
}