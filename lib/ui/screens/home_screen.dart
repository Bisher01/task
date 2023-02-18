import 'package:bisher_task/binding/update_information_binding.dart';
import 'package:bisher_task/controller/delete_account_controller.dart';
import 'package:bisher_task/ui/screens/change_password_screen.dart';
import 'package:bisher_task/ui/screens/welcome_screen.dart';
import 'package:bisher_task/utilities/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../binding/change_password_binding.dart';
import '../../utilities/app_colors.dart';
import '../widgets/custom_elevated_button.dart';
import 'update_information_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 15),
              child: Row(
                children:  [
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.0, end: 25),
                    child: Icon(
                      Icons.person_outlined,
                      color: MyColors.primary,
                    ),
                  ),
                  Text(
                    MySharedPreferences.name,
                    style: const TextStyle(
                        fontSize: 18,
                        color: MyColors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.0, end: 25),
                    child: Icon(
                      Icons.phone_android,
                      color: MyColors.primary,
                    ),
                  ),
                  Text(
                    "${MySharedPreferences.countryCode} ${MySharedPreferences.phone}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: MyColors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children:  [
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.0, end: 25),
                    child: Icon(
                      Icons.mail_outline,
                      color: MyColors.primary,
                    ),
                  ),
                  Text(
                    MySharedPreferences.email,
                    style: const TextStyle(
                        fontSize: 18,
                        color: MyColors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                Get.to(() =>  UpdateInformationScreen(),binding: UpdateInformationBinding());
              },
              title: 'Update Information',
              padding: const EdgeInsets.only(bottom: 5),
            ),
            CustomElevatedButton(
              onPressed: () {
                Get.to(()=> ChangePasswordScreen(),binding: ChangePasswordBinding());
              },
              title: 'Change Password',
              padding: const EdgeInsets.symmetric(vertical: 5),
            ),
            CustomElevatedButton(
              onPressed: () {
                final controller = Get.put(DeleteAccountController());
                controller.deleteAccount(context);
              },
              title: 'Delete Account',
              padding: const EdgeInsets.symmetric(vertical: 5),
            ),
            CustomElevatedButton(
              onPressed: () {
                MySharedPreferences.clearProfile();
                Get.offAll(()=>const WelcomeScreen());
              },
              title: 'Logout',
              padding: const EdgeInsets.symmetric(vertical: 5),
            ),
          ],
        ),
      ),
    );
  }
}
