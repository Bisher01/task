import 'package:bisher_task/binding/login_binding.dart';
import 'package:bisher_task/controller/register_controller.dart';
import 'package:bisher_task/utilities/widget_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_images.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 120,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 26,
                      color: MyColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: widgetSize.getHeight(40),
                ),
                CustomTextField(
                  controller: RegisterController.find.nameCtrl,
                  margin: const EdgeInsets.only(bottom: 10),
                  hintText: 'Full Name',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey,
                    fontSize: 18,
                  ),
                  width: 265,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: RegisterController.find.phoneCtrl,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  hintText: '55994435',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey,
                    fontSize: 18,
                  ),
                  width: 265,
                  prefixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 15.0),
                    child: Image.asset(
                      AppImages.uae,
                      width: 5,
                    ),
                  ),
                  suffixIcon: const SizedBox(
                    width: 20,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your phone';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: RegisterController.find.emailCtrl,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  hintText: 'Email Address',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey,
                    fontSize: 18,
                  ),
                  width: 265,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                GetBuilder<RegisterController>(builder: (controller) {
                  return CustomTextField(
                    controller: controller.passwordCtrl,
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                    prefixIcon: const SizedBox(
                      width: 20,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  );
                }),
                GetBuilder<RegisterController>(
                  builder: (controller) {
                    return CustomTextField(
                      controller: controller.passwordConfirmCtrl,
                      margin: const EdgeInsets.only(top: 10, bottom: 40),
                      hintText: 'Confirm Password',
                      obscureText: controller.passwordConfirmObscure.value,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.grey,
                        fontSize: 18,
                      ),
                      width: 265,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changePasswordConfirmObscure();
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: controller.passwordConfirmObscure.value
                              ? MyColors.grey
                              : MyColors.primary,
                        ),
                        splashRadius: 20,
                      ),
                      prefixIcon: const SizedBox(
                        width: 20,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm your password';
                        }
                        return null;
                      },
                    );
                  },
                ),
                CustomOutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      RegisterController.find.register(context: context);
                    }
                  },
                  title: 'Register',
                  width: 260,
                  backgroundColor: MyColors.primary,
                  borderColor: MyColors.primary,
                  titleColor: Colors.white,
                ),
                SizedBox(
                  height: widgetSize.getHeight(60),
                ),
                //const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 15,
                        color: MyColors.primary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.off(() => const LoginScreen(),
                            binding: LoginBinding());
                      },
                      child: const Text(
                        'Login',
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
        ),
      ),
    );
  }
}
