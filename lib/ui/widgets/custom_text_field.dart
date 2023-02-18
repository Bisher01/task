import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utilities/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Widget? suffixIcon;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final double? horizontalPadding;
  final EdgeInsetsGeometry? padding,margin;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final String? initialValue;
  final double? width,height;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.textDirection,
    this.keyboardType,
    this.readOnly = false,
    this.suffixIcon,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.labelStyle,
    this.hintStyle,
    this.prefixIcon,
    this.textAlign,
    this.horizontalPadding,
    this.inputFormatters,
    this.padding,
    this.margin,
    this.onChanged,
    this.initialValue,
    this.width,
    this.height,
  }) : super(key: key);

  final _border = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        autovalidateMode: autoValidateMode,
        textAlign: textAlign ?? TextAlign.center,
        readOnly: readOnly,
        style: const TextStyle(color: MyColors.primary, fontSize: 18,fontWeight: FontWeight.w600),
        keyboardType: keyboardType,
        textDirection: textDirection,
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        cursorColor: MyColors.primary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0, vertical: 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_border),
            borderSide: const BorderSide(color: MyColors.grey),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_border),
            borderSide: const BorderSide(color: MyColors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_border),
            borderSide: const BorderSide(color: MyColors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_border),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_border),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorStyle: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
