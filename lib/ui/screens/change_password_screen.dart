import 'package:bisher_task/controller/change_password_controller.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: ChangePasswordController.find.currentPasswordCtrl,
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  hintText: 'Current Password',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey,
                    fontSize: 18,
                  ),
                  width: 265,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your current password';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: ChangePasswordController.find.passwordCtrl,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey,
                    fontSize: 18,
                  ),
                  width: 265,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: ChangePasswordController.find.passwordConfirmCtrl,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  hintText: 'Confirm Password',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey,
                    fontSize: 18,
                  ),
                  width: 265,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm your password';
                    }
                    return null;
                  },
                ),
                CustomOutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      ChangePasswordController.find.updatePassword(context);
                    }
                  },
                  title: 'Save',
                  width: 265,
                  titleColor: Colors.white,
                  borderColor: MyColors.primary,
                  backgroundColor: MyColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
