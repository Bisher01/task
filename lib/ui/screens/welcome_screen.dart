import 'package:bisher_task/binding/login_binding.dart';
import 'package:bisher_task/binding/register_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../widgets/custom_outlined_button.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                height: 120,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Welcome to the app',
                  style: TextStyle(
                    fontSize: 26,
                    color: MyColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              CustomOutlinedButton(
                onPressed: () {
                  Get.to(()=>const LoginScreen(),binding: LoginBinding());
                },
                title: 'Login',
                width: 260,
                padding: const EdgeInsets.only(bottom: 10),
                backgroundColor: MyColors.primary,
                borderColor: MyColors.primary,
                titleColor: Colors.white,
              ),
              CustomOutlinedButton(
                onPressed: () {
                  Get.to(()=> RegisterScreen(),binding: RegisterBinding());
                },
                title: 'Register',
                width: 260,
                padding: const EdgeInsets.only(top: 5),
                backgroundColor: Colors.white,
                borderColor: MyColors.primary,
                titleColor: MyColors.primary,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Designed & Developed by',
                    style: TextStyle(
                      fontSize: 15,
                      color: MyColors.primary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ali Fouad',
                      style: TextStyle(
                        fontSize: 15,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
