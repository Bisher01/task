import 'package:bisher_task/binding/register_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_field.dart';
import 'register_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppImages.logo,
              height: 120,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 26,
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            CustomTextField(
              controller: LoginController.find.emailCtrl,
              hintText: 'Email Address',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.grey,
                fontSize: 18,
              ),
              height: 50,
              width: 265,
            ),
            GetBuilder<LoginController>(
              builder: (controller) {
                return CustomTextField(
                  controller: controller.passwordCtrl,
                  margin: const EdgeInsets.only(top: 20,bottom: 40),
                  hintText: 'Password',
                  obscureText: controller.passwordObscure.value,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey,
                    fontSize: 18,
                  ),
                  width: 265,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.changePasswordObscure();
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: controller.passwordObscure.value
                          ? MyColors.grey
                          : MyColors.primary,
                    ),
                    splashRadius: 20,
                  ),
                  prefixIcon: const SizedBox(width: 20,),
                );
              }
            ),
            CustomOutlinedButton(
              onPressed: () {
                LoginController.find.login(context: context);
              },
              title: 'Login',
              width: 260,
              padding: const EdgeInsets.only(bottom: 10),
              backgroundColor: MyColors.primary,
              borderColor: MyColors.primary,
              titleColor: Colors.white,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont\'t have an account?',
                  style: TextStyle(
                    fontSize: 15,
                    color: MyColors.primary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.off(()=> RegisterScreen(),binding: RegisterBinding());
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 15,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
