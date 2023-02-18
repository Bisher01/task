import 'package:bisher_task/controller/update_information_controller.dart';
import 'package:bisher_task/ui/widgets/custom_outlined_button.dart';
import 'package:bisher_task/utilities/app_images.dart';
import 'package:bisher_task/utilities/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../widgets/custom_text_field.dart';

class UpdateInformationScreen extends StatelessWidget {
  UpdateInformationScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Information'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: UpdateInformationController.find.nameCtrl,
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
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
                  controller: UpdateInformationController.find.phoneCtrl,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                  controller: UpdateInformationController.find.emailCtrl,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
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
                CustomOutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      UpdateInformationController.find
                          .updateInformation(context);
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
